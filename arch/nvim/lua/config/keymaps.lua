local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Save
map("n", "<C-s>", "<cmd>w<cr>", opts)

-- Quit
map("n", "<C-q>", "<cmd>q<cr>", opts)

-- Escape terminal mode
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Move selected text
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Split windows
map("n", "<leader>sv", "<cmd>vsplit<cr>", opts)
map("n", "<leader>sh", "<cmd>split<cr>", opts)

-- Close current window
map("n", "<leader>x", "<cmd>close<cr>", opts)

-- Terminal
map("n", "<leader>tt", "<cmd>split | terminal<cr>", opts)

