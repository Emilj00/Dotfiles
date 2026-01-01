local function run_command_palette()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values

	package.loaded["nvcode.command_palette"] = nil
	local actions_list = require("nvcode.command_palette")

	pickers
		.new(
			require("telescope.themes").get_dropdown({
				layout_config = {
					width = 0.45,
					height = 0.3,

					prompt_position = "top",
					mirror = true,
					anchor = "N",
				},
			}),
			{
				prompt_title = "Command Palette",
				finder = finders.new_table({
					results = actions_list,
					entry_maker = function(entry)
						local name = entry[1]
						local is_invalid = name == "" or name:match("^%-%-")

						return {
							value = entry,
							display = name,
							ordinal = is_invalid and "" or name,
						}
					end,
				}),
				sorter = conf.generic_sorter({}),
				attach_mappings = function(prompt_bufnr)
					actions.select_default:replace(function()
						local selection = action_state.get_selected_entry()

						if not selection or selection.display == "" or selection.display:match("^%-%-") then
							return
						end

						actions.close(prompt_bufnr)
						selection.value[2]()
					end)
					return true
				end,
			}
		)
		:find()
end

local function get_ignored_patterns()
	local final_ignores = { "%.git/.*" }
	local settings = require("nvcode.vscode-settings")

	local vscode_patterns = settings.get_excluded_patterns()

	for _, pattern in ipairs(vscode_patterns) do
		local lua_pattern = pattern:gsub("%.", "%%.")

		lua_pattern = lua_pattern:gsub("%*%*/", "")
		lua_pattern = lua_pattern:gsub("%*", ".*")

		table.insert(final_ignores, lua_pattern)
	end

	return final_ignores
end

local function config()
	local map = vim.keymap.set

	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local builtin = require("telescope.builtin")

	telescope.setup({
		defaults = {
			file_ignore_patterns = get_ignored_patterns(),

			mappings = {
				i = {
					["<esc>"] = actions.close + actions.center,
					["<CR>"] = actions.select_default + actions.center,
				},
				n = {
					["<esc>"] = actions.close,
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			current_buffer_fuzzy_find = {
				sorting_strategy = "ascending",
			},
			colorscheme = {
				enable_preview = true,
				ignore_builtins = true,
			},
		},
	})

	map({ "n", "i", "v" }, "<C-S-p>", run_command_palette)

	map({ "i", "n", "v" }, "<C-e>", builtin.find_files)
	map({ "i", "n", "v" }, "<C-p>", builtin.find_files)

	map({ "i", "n", "v" }, "<C-f>", builtin.current_buffer_fuzzy_find)
	map({ "i", "n", "v" }, "<C-S-f>", builtin.live_grep)
end

local dependencies = {
	"nvim-lua/plenary.nvim",
}

return {
	"nvim-telescope/telescope.nvim",

	config = config,
	dependencies = dependencies,
}

