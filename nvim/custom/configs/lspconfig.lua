local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "bashls", "emmet_ls", "clangd", "pyright"}
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end

	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		init_options = {
			preferences = {
				disableSuggestions = true,
			},
		},
	})
	lspconfig.pyright.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "python" },
	})

-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
--
-- local lspconfig = require "lspconfig"
--
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
-- lspconfig.rust_analyzer.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "rust" },
--   root_dir = lspconfig.util.root_pattern "Cargo.toml",
-- }
-- lspconfig.prettier.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "cpp", "js" },
-- }
