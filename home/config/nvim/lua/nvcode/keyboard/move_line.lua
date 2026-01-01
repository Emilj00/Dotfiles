local map = vim.keymap.set

map("i", "<M-Up>", "<Esc>:m .-2<CR>==gi")
map("i", "<M-Down>", "<Esc>:m .+1<CR>==gi")

map("v", "<M-Up>", ":m '<-2<CR>gv=gv")
map("v", "<M-Down>", ":m '>+1<CR>gv=gv")

