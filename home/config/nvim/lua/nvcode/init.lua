local function require_recursive(path, mod_prefix)
    for _, file in ipairs(vim.fn.readdir(path)) do
        local full_path = path .. "/" .. file
        local attr = vim.loop.fs_stat(full_path)

        if attr then
            -- 2. Added check to skip "plugins.lua" since it's already loaded
            if attr.type == "file" and file:sub(-4) == ".lua" and file ~= "plugins.lua" then
                local modname = mod_prefix .. "." .. file:sub(1, -5)
                pcall(require, modname)
            elseif attr.type == "directory" then
                require_recursive(full_path, mod_prefix .. "." .. file)
            end
        end
    end
end

local nvcode_dir = vim.fn.stdpath("config") .. "/lua/nvcode"

require_recursive(nvcode_dir .. "/keyboard", "nvcode.keyboard")
pcall(require, "nvcode.plugins")

require_recursive(nvcode_dir, "nvcode")

