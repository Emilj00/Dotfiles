local map = vim.keymap.set

map("i", "<C-CR>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>o", true, false, true), "n", true)
end)

map("i", "<S-C-CR>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>O", true, false, true), "n", true)
end)

