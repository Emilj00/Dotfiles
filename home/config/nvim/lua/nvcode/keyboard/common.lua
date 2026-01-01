local map = vim.keymap.set

map({"i", "n", "v"}, "<C-s>", "<C-o>:w<CR>")
map({"i", "n", "v"}, "<C-q>", "<C-o>:q!<CR>")

