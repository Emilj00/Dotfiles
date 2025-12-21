-- lua/vimcode/init.lua
local function require_recursive(path, mod_prefix)
	for _, file in ipairs(vim.fn.readdir(path)) do
		local full_path = path .. "/" .. file
		local attr = vim.loop.fs_stat(full_path)

		if attr then
			if attr.type == "file" and file:sub(-4) == ".lua" then
				local modname = mod_prefix .. "." .. file:sub(1, -5)
				pcall(require, modname)
			elseif attr.type == "directory" and file ~= "plugins" then
				require_recursive(full_path, mod_prefix .. "." .. file)
			end
		end
	end
end

local nvcode_dir = vim.fn.stdpath("config") .. "/lua/nvcode"
require_recursive(nvcode_dir, "nvcode")
