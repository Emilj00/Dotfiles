local function config()
	require("dashboard").setup({
        theme = 'hyper'    -- theme is doom and hyper default is hyper
    })
end

local dependencies = {
	"nvim-tree/nvim-web-devicons",
}

return {
	"nvimdev/dashboard-nvim",

	config = config,
	dependencies = dependencies,
}

