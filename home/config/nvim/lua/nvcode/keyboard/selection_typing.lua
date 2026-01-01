local map = vim.keymap.set
local keys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789`~!@#$%^&*()-_=+[]{}\\|;:'\",.<>/?"

for i = 1, #keys do
    local char = keys:sub(i, i)
    local hex = string.format("%02x", string.byte(char))

    map("v", char, '"_c<Char-0x' .. hex .. '>', { nowait = true })
end

map("v", " ", '"_c ')
map("v", "<CR>", '"_c<CR>')
