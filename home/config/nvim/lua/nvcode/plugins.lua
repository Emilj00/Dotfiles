local lazy = require("lazy")
lazy.setup({
	spec = {
		{ import = "nvcode.plugins.ui" },
		{ import = "nvcode.plugins.ui.themes" },

		{ import = "nvcode.plugins.coding" },

		-- { import = "nvcode.plugins.utils" },
	},
})

