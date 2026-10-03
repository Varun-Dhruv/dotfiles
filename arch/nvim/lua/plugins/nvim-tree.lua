return {
    {
        "nvim-tree/nvim-tree.lua",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },

                view = {
                    width = 32,
                },

                renderer = {
                    group_empty = true,
                },

                filters = {
                    dotfiles = false,
                },
            })

            vim.keymap.set(
                "n",
                "<leader>e",
                "<cmd>NvimTreeToggle<cr>",
                { silent = true }
            )

            vim.keymap.set(
                "n",
                "<leader>o",
                "<cmd>NvimTreeFocus<cr>",
                { silent = true }
            )
        end,
    },
}