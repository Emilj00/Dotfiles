local function enforce_insert()
    local ft = vim.bo.filetype
    local buftype = vim.bo.buftype
    local mode = vim.api.nvim_get_mode().mode

    if (ft == "neo-tree-popup") then
      vim.schedule(function()
        vim.cmd("startinsert")
      end)
      return
    end

    if ft == "neo-tree" or ft == "lazy" then
        if mode ~= "n" then
            vim.schedule(function()
                vim.cmd("stopinsert")
            end)
        end
        return
    end

    if buftype == "" and mode == "n" then
        vim.schedule(function()
            vim.cmd("startinsert")
        end)
    end
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    callback = enforce_insert,
})

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = enforce_insert,
})
