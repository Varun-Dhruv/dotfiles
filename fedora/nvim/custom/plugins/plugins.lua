local plugins = {
	{
		"neovim/nvim-lspconfig",
    config = function ()
      require("custom.configs.lspconfig")
      require("plugins.configs.lspconfig")
    end,
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("plugins.configs.lspconfig")
		  	require("custom.configs.lspconfig")
				require("custom.configs.null-ls")
			end,
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"rust-analyzer",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"github/copilot.vim",
		cmd = { "Copilot", "CopilotLine", "Copilot setup" },
		lazy = false,
		-- enable co pilot for suggestions in insert mode
	},
}
require("custom.plugins.copilot")

return plugins
