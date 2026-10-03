return {
    {
        "neovim/nvim-lspconfig",
    },

    {
        "mason-org/mason.nvim",

        opts = {
            ensure_installed = {
                "ruff",
                "debugpy",
                "prettier",
                "eslint_d",
                "stylua",
                "gofumpt",
                "clang-format",
            },
        },
    },

    {
        "mason-org/mason-lspconfig.nvim",

        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        opts = {
            ensure_installed = {
                "gopls",
                "clangd",
                "pyright",
                "ts_ls",
                "lua_ls",
            },

            automatic_enable = true,
        },
    },
}