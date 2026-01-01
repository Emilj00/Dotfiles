local function config()
	local theme = require("last-color").recall() or "default"
	vim.cmd(("colorscheme %s"):format(theme))
end

local dependencies = {}

return {
	"raddari/last-color.nvim",

	config = config,
	dependencies = dependencies,
}

