local M = {}

local function get_vscode_json()
    local path = vim.fn.getcwd() .. "/.vscode/settings.json"
    if vim.fn.filereadable(path) == 1 then
        local data = vim.fn.readfile(path)
        local success, json = pcall(vim.json.decode, table.concat(data, ""))
        if success and json["files.exclude"] then
            return json["files.exclude"]
        end
    end
    return nil
end

M.get_excluded_patterns = function()
    local patterns = { ".git" }
    local json_exclude = get_vscode_json()

    if json_exclude then
        for pattern, enabled in pairs(json_exclude) do
            if enabled then
                table.insert(patterns, pattern)
            end
        end
    end
    return patterns
end

M.get_excluded_files = function()
    local root = vim.fn.getcwd()
    local raw_patterns = M.get_excluded_patterns()
    local expanded_files = {}
    local hash = {}

    for _, pattern in ipairs(raw_patterns) do
        if not pattern:find("[*?%[]") then
            if not hash[pattern] then
                table.insert(expanded_files, pattern)
                hash[pattern] = true
            end
        else
            local search_pattern = pattern
            if pattern:sub(1, 3) == "**/" then
                search_pattern = pattern:sub(4)
            end

            local matches = vim.fn.globpath(root, "**/" .. search_pattern, true, true)

            for _, match in ipairs(matches) do
                local name = vim.fn.fnamemodify(match, ":t")
                if not hash[name] then
                    table.insert(expanded_files, name)
                    hash[name] = true
                end
            end
        end
    end

    return expanded_files
end

return M

