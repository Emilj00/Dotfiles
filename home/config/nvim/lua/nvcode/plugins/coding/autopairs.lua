local function config()
	require("nvim-autopairs").setup({})
end

local dependencies = {}

return {
	"windwp/nvim-autopairs",

	config = config,
	dependencies = dependencies,
}
