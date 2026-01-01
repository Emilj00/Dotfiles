local function config()
	local illuminate = require("illuminate")

	illuminate.configure({
		providers = {
			"lsp",
		},
	})
end

local dependencies = {}

return {
	"RRethy/vim-illuminate",

	config = config,
	dependencies = dependencies,
}

