local map = vim.keymap.set

vim.opt.clipboard = "unnamedplus"

-- Copy
map("v", "<C-c>", function()
  vim.cmd('normal! "+y')
  vim.cmd('normal! gv')
end)
map("i", "<C-c>", function()
  local col = vim.fn.col(".")
  vim.cmd("normal! yy")
  vim.fn.cursor(vim.fn.line("."), col)
end)

-- Cut
map("v", "<C-x>", function()
  vim.cmd('normal! "+d')
end)
map("i", "<C-x>", function()
  local col = vim.fn.col(".")
  vim.cmd("normal! dd")
  vim.fn.cursor(vim.fn.line("."), col)
end)

-- Paste
map("i", "<C-v>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.cmd("normal! \"+P")
  vim.api.nvim_feedkeys("a", "n", true)
end)
map("v", "<C-v>", function()
  vim.cmd('normal! "+p')
end)

-- Undo / Redo
map({"n", "i", "v", "s"}, "<C-z>", "<C-o>u")
map({"n", "i", "v", "s"}, "<C-y>", "<C-o><C-r>")

