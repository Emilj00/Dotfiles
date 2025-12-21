local function config()
	local cmp = require("cmp")

	cmp.setup({
		mapping = {
			["<C-Space>"] = cmp.mapping.complete(),

			["<Down>"] = cmp.mapping.select_next_item(),
			["<Up>"] = cmp.mapping.select_prev_item(),

			["<Tab>"] = cmp.mapping.confirm({
				select = true,
				behavior = cmp.ConfirmBehavior.Insert,
			}),

			["<Esc>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.abort()
				else
					fallback()
				end
			end, { "i", "s" }),
		},

		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
		},
	})
end

local dependencies = {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
}

return {
	"hrsh7th/nvim-cmp",

	config = config,
	dependencies = dependencies,
}
