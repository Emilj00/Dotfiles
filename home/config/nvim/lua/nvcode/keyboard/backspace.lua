local map = vim.keymap.set

map("i", "<C-BS>", function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<BS>", true, false, true), "n", false)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>", true, false, true), "n", false)
    end
end, { desc = "Clean VS Code Backspace" })

map("v", "<BS>", [["_d]])
map("v", "<Del>", [["_d]])
