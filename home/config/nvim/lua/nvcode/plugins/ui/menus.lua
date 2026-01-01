local function neotree_menu()
	local manager = require("neo-tree.sources.manager")
	local cc = require("neo-tree.sources.common.commands")

	local function get_state()
		local state = manager.get_state_for_window()
		state.config = state.config or {}

		return state
	end

	local function call(what)
		return vim.schedule_wrap(function()
			local state = get_state()
			local cb = require("neo-tree.sources." .. state.name .. ".commands")[what] or cc[what]
			cb(state)
		end)
	end

	local function copy_path(how)
		return function()
			local node = get_state().tree:get_node()
			if node.type == "message" then
				return
			end
			vim.fn.setreg('"', vim.fn.fnamemodify(node.path, how))
			vim.fn.setreg("+", vim.fn.fnamemodify(node.path, how))
		end
	end

	return {
		{ name = "  Open in vertical split", cmd = call("open_vsplit"), rtxt = "<C-\\>" },
		{ name = "  Open in horizontal split", cmd = call("open_split"), rtxt = "<C-->" },
		{ name = "󰓪  Open in new tab", cmd = call("open_tabnew") },

		{ name = "separator" },
		{ name = "  New file", cmd = call("add"), rtxt = "<C-n>" },
		{ name = "  New folder", cmd = call("add_directory"), rtxt = "<C-S-n>" },
		{ name = "  Delete", hl = "ExRed", cmd = call("delete"), rtxt = "<Del>" },
		{ name = "  Rename", cmd = call("rename"), rtxt = "<F2>" },

		{ name = "separator" },
		{ name = "  Copy", cmd = call("copy_to_clipboard"), rtxt = "<C-c>" },
		{ name = "  Cut", cmd = call("cut_to_clipboard"), rtxt = "<C-x>" },
		{ name = "  Paste", cmd = call("paste_from_clipboard"), rtxt = "<C-v>" },

		{ name = "separator" },
		{ name = "󰴠  Copy path", cmd = copy_path(":p"), rtxt = "<C-A-c>" },
	}
end

local menus = {
	["neo-tree"] = neotree_menu,
}

local function focus_and_open_context()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<LeftMouse>", true, false, true), "n", true)

	vim.schedule(function()
		local cur_win = vim.api.nvim_get_current_win()
		local cur_buf = vim.api.nvim_win_get_buf(cur_win)
		local file_type = vim.api.nvim_get_option_value("filetype", { buf = cur_buf })

		local menu_fn = menus[file_type]
		if menu_fn then
			require("menu").open(menu_fn())
		end
	end)
end

local function config()
	vim.keymap.set({ "n", "i" }, "<RightMouse>", focus_and_open_context)

	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		callback = function()
			local menu_state = require("menu.state")

			if menu_state.bufids and #menu_state.bufids > 0 then
				pcall(function()
					require("menu.utils").delete_old_menus()
				end)

				local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
				vim.api.nvim_feedkeys(esc, "n", false)
			end
		end,
	})
end

local dependencies = {
	"nvzone/volt",
}

return {
	"nvzone/menu",

	config = config,
	dependencies = dependencies,
}

