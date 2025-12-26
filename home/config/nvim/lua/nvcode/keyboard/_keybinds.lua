local map = vim.keymap.set

vim.opt.timeoutlen = 1 -- Set to 300ms

local modes = { "n", "i", "v", "x", "s", "o", "c", "t" }

-- local keys = {
  -- "<PageUp>", "<PageDown>", "<Home>", "<End>",
  -- "<Insert>", "<Esc>",
  -- "<F1>", "<F2>", "<F3>", "<F4>", "<F5>", "<F6>", "<F7>", "<F8>", "<F9>", "<F10>", "<F11>", "<F12>"
-- }

local keys = {
  "<F1>", "<F2>", "<F3>", "<F4>", "<F5>", "<F6>", "<F7>", "<F8>", "<F9>", "<F10>", "<F11>", "<F12>",

  "<PageUp>", "<PageDown>", "<Home>", "<End>", "<Insert>", "<Esc>",

  "<C-a>", "<C-b>", "<C-c>", "<C-d>", "<C-e>", "<C-f>", "<C-g>", "<C-h>", "<C-i>", "<C-j>", "<C-k>", "<C-l>",
  "<C-m>", "<C-n>", "<C-o>", "<C-p>", "<C-q>", "<C-r>", "<C-s>", "<C-t>", "<C-u>", "<C-v>", "<C-w>", "<C-x>",
  "<C-y>", "<C-z>",

  "<A-a>", "<A-b>", "<A-c>", "<A-d>", "<A-e>", "<A-f>", "<A-g>", "<A-h>", "<A-i>", "<A-j>", "<A-k>", "<A-l>",
  "<A-m>", "<A-n>", "<A-o>", "<A-p>", "<A-q>", "<A-r>", "<A-s>", "<A-t>", "<A-u>", "<A-v>", "<A-w>", "<A-x>",
  "<A-y>", "<A-z>",

  -- Combinations of Ctrl + Shift and Alt + Shift
  "<C-S-a>", "<C-S-b>", "<C-S-c>", "<C-S-d>", "<C-S-e>", "<C-S-f>", "<C-S-g>", "<C-S-h>", "<C-S-i>", "<C-S-j>",
  "<C-S-k>", "<C-S-l>", "<C-S-m>", "<C-S-n>", "<C-S-o>", "<C-S-p>", "<C-S-q>", "<C-S-r>", "<C-S-s>", "<C-S-t>",
  "<C-S-u>", "<C-S-v>", "<C-S-w>", "<C-S-x>", "<C-S-y>", "<C-S-z>",

  "<A-S-a>", "<A-S-b>", "<A-S-c>", "<A-S-d>", "<A-S-e>", "<A-S-f>", "<A-S-g>", "<A-S-h>", "<A-S-i>", "<A-S-j>",
  "<A-S-k>", "<A-S-l>", "<A-S-m>", "<A-S-n>", "<A-S-o>", "<A-S-p>", "<A-S-q>", "<A-S-r>", "<A-S-s>", "<A-S-t>",
  "<A-S-u>", "<A-S-v>", "<A-S-w>", "<A-S-x>", "<A-S-y>", "<A-S-z>",

  -- Additional printable characters
  "<1>", "<2>", "<3>", "<4>", "<5>", "<6>", "<7>", "<8>", "<9>", "<0>",
  "<Minus>", "<Equal>", "<BracketLeft>", "<BracketRight>", "<Backslash>", "<Semicolon>", "<Quote>",
  "<Comma>", "<Period>", "<Slash>", "<Tilde>", "<ExclamationMark>", "<At>", "<Hash>", "<Dollar>", "<Percent>",
  "<Caret>", "<Ampersand>", "<Asterisk>", "<LeftParen>", "<RightParen>", "<Underscore>", "<Plus>", "<LeftBrace>",
  "<RightBrace>", "<Colon>", "<DoubleQuote>", "<LessThan>", "<GreaterThan>", "<QuestionMark>", "<Backtick>"
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
