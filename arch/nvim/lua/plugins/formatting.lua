return {
    {
        "stevearc/conform.nvim",

        event = { "BufWritePre" },

        opts = {
            formatters_by_ft = {
                python = { "ruff_format" },

                javascript = { "prettier" },
                javascriptreact = { "prettier" },

                typescript = { "prettier" },
                typescriptreact = { "prettier" },

                json = { "prettier" },
                yaml = { "prettier" },

                html = { "prettier" },
                css = { "prettier" },

                lua = { "stylua" },

                go = { "gofumpt" },

                cpp = { "clang_format" },
                c = { "clang_format" },
            },

            format_on_save = {
                timeout_ms = 1000,
                lsp_fallback = true,
            },
        },
    },
}