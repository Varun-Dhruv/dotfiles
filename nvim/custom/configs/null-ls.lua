local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	null_ls.builtins.formatting.clang_format,
	formatting.prettier,
	formatting.stylua,
  formatting.eslint_d,
  formatting.black,
	lint.shellcheck,
}
null_ls.setup({
	debug = true,
	sources = sources,
})
