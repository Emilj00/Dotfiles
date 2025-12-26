local function config()
	local map = vim.keymap.set

	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local builtin = require("telescope.builtin")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
                n = {
					["<esc>"] = actions.close,
                }
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				file_ignore_patterns = { "%.git/*" },
			},
			colorscheme = {
				enable_preview = true,
			},
		},
	})

	map("i", "<C-e>", builtin.find_files)
    map({ "n", "i" }, "<C-f>", builtin.live_grep)
    -- map("i", "<C-S-f>", builtin.live_grep)
	map("i", "<C-t>", builtin.colorscheme)

    map("n", "<C-e>", builtin.find_files)
    -- map("n", "<C-S-f>", builtin.live_grep)
	map("n", "<C-t>", builtin.colorscheme)
end

local dependencies = {
	"nvim-lua/plenary.nvim",
}

return {
	"nvim-telescope/telescope.nvim",

	config = config,
	dependencies = dependencies,
}
