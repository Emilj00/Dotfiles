local M = {}
local Terminal = require("toggleterm.terminal").Terminal

local is_windows = vim.loop.os_uname().version:match("Windows")
local nvim_data = vim.fn.stdpath("data")
local bin_dir = nvim_data .. "/lazygit_bin"
local lazygit_path = bin_dir .. (is_windows and "/lazygit.exe" or "/lazygit")

local function download_lazygit()
	if vim.fn.filereadable(lazygit_path) == 1 then
		return
	end

	vim.notify("Lazygit not found. Downloading to " .. bin_dir .. "...", vim.log.levels.INFO)
	vim.fn.mkdir(bin_dir, "p")

	local os_type = is_windows and "Windows" or vim.loop.os_uname().sysname
	local arch = vim.loop.os_uname().machine
	if arch == "x86_64" then
		arch = "x86_64"
	end -- standard

	local version = "0.57.0"
	local extension = is_windows and "zip" or "tar.gz"
	local url = string.format(
		"https://github.com/jesseduffield/lazygit/releases/download/v%s/lazygit_%s_%s_%s.%s",
		version,
		version,
		os_type,
		arch,
		extension
	)

	local download_cmd
	if is_windows then
		download_cmd = string.format(
			"curl -L %s -o %s/lazygit.%s && tar -xf %s/lazygit.%s -C %s",
			url,
			bin_dir,
			extension,
			bin_dir,
			extension,
			bin_dir
		)
	else
		download_cmd = string.format("curl -L %s | tar -xz -C %s", url, bin_dir)
	end

	vim.fn.jobstart(download_cmd, {
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("Lazygit downloaded successfully!", vim.log.levels.INFO)
			else
				vim.notify("Failed to download Lazygit.", vim.log.levels.ERROR)
			end
		end,
	})
end

download_lazygit()

M.lazygit = Terminal:new({
	cmd = lazygit_path,
	dir = "git_dir",

	direction = "float",

	hidden = true,
	start_in_insert = true,

	on_open = function(term)
		vim.cmd("startinsert!")
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n><cmd>close<CR>]], {
			silent = true,
			buffer = term.bufnr,
		})
	end,
})

vim.keymap.set({ "n", "i" }, "<C-S-g>", function()
	M.lazygit:toggle()
end)

return M

