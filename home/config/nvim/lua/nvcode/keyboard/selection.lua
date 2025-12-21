local map = vim.keymap.set

local fk = function(keys, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", mode)
end



vim.o.selection = "exclusive"
vim.opt.virtualedit = "onemore"



map("i", "<S-Left>", function() fk("<C-o>vh", true) end)
map("i", "<S-Right>", function() fk("<C-o>vl", true) end)
map("i", "<S-Down>", function() fk("<C-o>vj", true) end)
map("i", "<S-Up>", function() fk("<C-o>vk", true) end)



map("v", "<S-Left>", "<Left>")
map("v", "<S-Right>", "<Right>")
map("v", "<S-Up>", "<Up>")
map("v", "<S-Down>", "<Down>")

map("i", "<S-C-Right>", function() fk("<C-o>ve", false) end)
map("i", "<S-C-Left>", function() fk("<C-o>vb", false) end)
map("v", "<S-C-Right>", "e")
map("v", "<S-C-Left>", "b")



map("v", "<Esc>", "<Esc>i")



map("i", "<S-Home>", "<Esc>v^")
map("i", "<S-End>", "<Esc>v$")

map("v", "<S-Home>", "gV^")
map("v", "<S-End>", "gV$")

map("v", "<Home>", "<Esc>^")
map("v", "<End>", "<Esc>$")



map("i", "<C-a>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

    vim.api.nvim_win_set_cursor(0, { 1, 0 })
    vim.api.nvim_feedkeys("v", "n", false)

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("G$", true, false, true), "n", false)
end)
