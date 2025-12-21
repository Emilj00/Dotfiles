local map = vim.keymap.set

map("i", "<C-CR>", function()
    return vim.api.nvim_replace_termcodes("<Esc>o", true, false, true)
end, { expr = true, desc = "Insert line below with indentation" })

map("i", "<S-C-CR>", function()
    return vim.api.nvim_replace_termcodes("<Esc>O", true, false, true)
end, { expr = true, desc = "Insert line above with indentation" })
