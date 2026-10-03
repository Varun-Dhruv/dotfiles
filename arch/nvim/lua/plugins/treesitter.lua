return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "bash",
                    "json",
                    "yaml",
                    "python",
                    "javascript",
                    "typescript",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "go",
                    "gomod",
                    "cpp",
                    "c",
                },

                highlight = {
                    enable = true,
                },

                indent = {
                    enable = true,
                },
            })
        end,
    },
}