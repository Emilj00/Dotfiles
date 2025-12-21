local map = vim.keymap.set

map("i", "<S-Tab>", "<Esc><<i", { silent = true })

map("v", "<Tab>", ">gv", { silent = true })
map("v", "<S-Tab>", "<gv", { silent = true })
