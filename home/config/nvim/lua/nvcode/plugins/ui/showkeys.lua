local function config()
	require("showkeys").setup({ maxkeys = 7, timeout = 1 })
end

local dependencies = {}

return {
	"nvzone/showkeys",

	config = config,
	dependencies = dependencies,
}

