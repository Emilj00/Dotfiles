local M = {}
local Terminal = require("toggleterm.terminal").Terminal

M.lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",

	direction = "float",

	hidden = true,
	start_in_insert = true,

    on_open = function(term)
        vim.cmd("startinsert!")
        vim.keymap.set(term.bufnr, "t", "<Esc>", "<cmd>close<CR>", {silent = true, noremap = true})
    end,
})

vim.keymap.set({ "n", "i" }, "<C-S-g>", function()
	M.lazygit:toggle()
end)

return M

