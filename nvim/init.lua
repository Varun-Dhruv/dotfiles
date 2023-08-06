-- Import Lua modules
require('core/lazy')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('core/statusline')
require('core/options')
require('lsp/lspconfig')
require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-treesitter')
require('plugins/alpha-nvim')
require('plugins/mason-nvim')
require('plugins/copilot')
require('plugins/leetcode')

let leetcode_browser = 'firefox';
let leetcode_solution_filetype = 'cpp' ;