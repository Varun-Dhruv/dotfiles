local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Undo
opt.undofile = true

-- Mouse
opt.mouse = "a"

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Keep cursor shape
opt.guicursor = ""

-- Don't show mode in command line
opt.showmode = false

-- Persistent sign column
opt.signcolumn = "yes"

-- Better command line
opt.cmdheight = 1