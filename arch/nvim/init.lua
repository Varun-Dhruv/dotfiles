-- =========================================================
-- Leader keys
-- =========================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =========================================================
-- Core configuration
-- =========================================================

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- =========================================================
-- Bootstrap lazy.nvim
-- =========================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- =========================================================
-- Plugin manager
-- =========================================================

require("lazy").setup({
	spec = {
		{
			import = "plugins",
		},
	},

	install = {
		colorscheme = {
			"nord",
		},
	},

	checker = {
		enabled = true,
	},

	change_detection = {
		notify = false,
	},
})

-- =========================================================
-- Common LSP configuration
-- =========================================================

local lsp = require("config.lsp")

vim.lsp.config("*", {
	on_attach = lsp.on_attach,
})

-- =========================================================
-- Enable LSP servers
-- =========================================================

vim.lsp.enable({
	"gopls",
	"clangd",
	"pyright",
	"ts_ls",
	"lua_ls",
})
