local plugins = {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("plugins.configs.lspconfig")
				-- require "custom.configs.lspconfig"
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
		"github/copilot.vim",
		cmd = { "Copilot", "CopilotLine", "Copilot setup" },
    lazy= false
		-- enable co pilot for suggestions in insert mode
	},
	{
		"ianding1/leetcode.vim",
	},
}
require('custom.plugins.null-ls')
require('custom.plugins.leetcode')
require('custom.plugins.copilot')
return plugins
