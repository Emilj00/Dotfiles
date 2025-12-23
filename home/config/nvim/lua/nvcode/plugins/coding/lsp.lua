local map = vim.keymap.set

local function config()
	local lsp_servers = {
		"lua_ls",
		"bashls",
		"jsonls",
		"nil_ls",
	}

	local linters = {}

	local formatters = {
		"stylua",
		"shfmt",
		"alejandra",
	}

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = lsp_servers,
		automatic_installation = true,
	})

	vim.diagnostic.config({
		virtual_text = true,
		signs = false,
		underline = false,
		update_in_insert = true,
	})

	local on_attach = function(_, _)
		map("i", "<F12>", vim.lsp.buf.definition)
		map("i", "<C-i>", vim.lsp.buf.hover)
	end

	local lsp_flags = {
		debounce_text_changes = 104,
	}

	for _, server in ipairs(lsp_servers) do
		vim.lsp.config(server, {
			on_attach = on_attach,
			flags = lsp_flags,
		})
		vim.lsp.enable(server)
	end

	local null_ls = require("null-ls")
	local mason_null_ls = require("mason-null-ls")

	local tools = {}
	for _, f in ipairs(formatters) do
		table.insert(tools, f)
	end
	for _, l in ipairs(linters) do
		table.insert(tools, l)
	end

	mason_null_ls.setup({
		ensure_installed = tools,
		automatic_installation = true,
	})

	local sources = {}
	for _, f in ipairs(formatters) do
		table.insert(sources, null_ls.builtins.formatting[f])
	end
	for _, l in ipairs(linters) do
		table.insert(sources, null_ls.builtins.diagnostics[l])
	end

	null_ls.setup({
		sources = sources,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				map("i", "<F4>", function()
					vim.lsp.buf.format({ async = true })
				end, { buffer = bufnr })
			end
		end,
	})
end

local dependencies = {
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	"nvimtools/none-ls.nvim",
	"jayp0525/mason-null-ls.nvim",
}

return {
	"neovim/nvim-lspconfig",

	config = config,
	dependencies = dependencies,
}
