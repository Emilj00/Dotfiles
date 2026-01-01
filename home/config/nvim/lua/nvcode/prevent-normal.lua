local Decision = {
	Insert = "insert",
	Normal = "normal",
	Exit = "exit",
}

Decision = setmetatable({}, {
	__index = Decision,
	__newindex = function()
		error("Cannot modify Decision Enum")
	end,
})

local function force_insert(mode)
	if mode ~= "i" then
		vim.cmd("startinsert!")
	end
end

local function force_normal(mode)
	if mode ~= "n" then
		vim.cmd("stopinsert!")
	end
end

local rules = {
	function(filetype, _, _)
		if filetype == "" then
			return
		end

		local force_normal_filetypes = { "dashboard", "neo-tree", "lazy", "mason" }

		for _, ft in ipairs(force_normal_filetypes) do
			if ft == filetype then
				return Decision.Normal
			end
		end
	end,

	function(filetype, _, _)
		if filetype == "toggleterm" then
			return Decision.Insert
		end
	end,

	function(filetype, _, _)
		if filetype == "neo-tree-popup" then
			return Decision.Insert
		end
	end,

	function(_, buftype, mode)
		if buftype == "" and mode == "n" then
			return Decision.Insert
		end
	end,
}

local function enforce_insert()
	local filetype = vim.bo.filetype
	local buftype = vim.bo.buftype
	local mode = vim.api.nvim_get_mode().mode

	for _, rule in ipairs(rules) do
		local result = rule(filetype, buftype, mode)

		if result == Decision.Insert then
			return force_insert(mode)
		elseif result == Decision.Normal then
			return force_normal(mode)
		elseif result == Decision.Exit then
			return
		end
	end
end

vim.api.nvim_create_autocmd({
	"BufEnter",
	"ModeChanged",
}, {
	callback = function()
		vim.schedule(enforce_insert)
	end,
})

