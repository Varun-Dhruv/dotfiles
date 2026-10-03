return {
    {
        "nvimdev/dashboard-nvim",

        event = "VimEnter",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            local db = require("dashboard")

            db.setup({
                theme = "hyper",

                config = {
                    header = {
                        "",
                        "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
                        "████╗  ██║██║   ██║██║████╗ ████║",
                        "██╔██╗ ██║██║   ██║██║██╔████╔██║",
                        "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                        "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                        "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
                        "",
                        "             Welcome back.",
                        "",
                    },

                    shortcut = {
                        {
                            desc = " Find File",
                            group = "@property",
                            key = "f",
                            action = "Telescope find_files",
                        },

                        {
                            desc = " Recent Files",
                            group = "@property",
                            key = "r",
                            action = "Telescope oldfiles",
                        },

                        {
                            desc = " File Tree",
                            group = "@property",
                            key = "e",
                            action = "NvimTreeToggle",
                        },

                        {
                            desc = " Grep",
                            group = "@property",
                            key = "g",
                            action = "Telescope live_grep",
                        },

                        {
                            desc = " Configuration",
                            group = "@property",
                            key = "c",
                            action = "edit $MYVIMRC",
                        },

                        {
                            desc = " Quit",
                            group = "@property",
                            key = "q",
                            action = "qa",
                        },
                    },

                    packages = {
                        enable = false,
                    },

                    project = {
                        enable = false,
                    },

                    mru = {
                        enable = true,
                        limit = 8,
                    },

                    footer = {
                        "",
                        "Space = Leader",
                    },
                },
            })
        end,
    },
}