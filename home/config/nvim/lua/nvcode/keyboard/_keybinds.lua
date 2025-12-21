local map = vim.keymap.set

vim.opt.timeoutlen = 1 -- Set to 300ms

local modes = { "n", "i", "v", "x", "s", "o", "c", "t" }

local keys = {
  "<PageUp>", "<PageDown>", "<Home>", "<End>",
  "<Insert>", "<Esc>",
  "<F1>", "<F2>", "<F3>", "<F4>", "<F5>", "<F6>", "<F7>", "<F8>", "<F9>", "<F10>", "<F11>", "<F12>"
}

for _, mode in ipairs(modes) do
  for _, key in ipairs(keys) do
    map(mode, key, "<Nop>")
  end
end

for _, mode in ipairs({ "n", "v" }) do
  for i = 32, 126 do
    local char = string.char(i)
    vim.keymap.set(mode, char, "<Nop>")
  end
end



vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "startinsert"
})

vim.opt.mouse = "a"

map({"i", "n", "v"}, "<C-s>", "<C-o>:w<CR>")
map({"i", "n", "v"}, "<C-q>", "<C-o>:q!<CR>")

map({"n", "i", "v"}, "<A-Space>", "<C-o>:")
