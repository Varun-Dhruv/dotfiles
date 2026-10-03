return {
    {
        "akinsho/bufferline.nvim",

        version = "*",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            options = {
                mode = "buffers",

                numbers = "ordinal",

                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",

                left_mouse_command = "buffer %d",
                middle_mouse_command = "bdelete! %d",

                diagnostics = "nvim_lsp",

                always_show_bufferline = true,

                show_buffer_close_icons = true,
                show_close_icon = false,

                separator_style = "slant",

                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    },
                },
            },
        },

        config = function(_, opts)
            require("bufferline").setup(opts)

            local map = vim.keymap.set

            -- Switch buffers
            map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {
                silent = true,
            })

            map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {
                silent = true,
            })

            -- Close current buffer
            map("n", "<leader>bd", "<cmd>bdelete<cr>", {
                silent = true,
            })

            -- Direct buffer selection
            for i = 1, 9 do
                map(
                    "n",
                    "<leader>" .. i,
                    "<cmd>BufferLineGoToBuffer " .. i .. "<cr>",
                    { silent = true }
                )
            end
        end,
    },
}