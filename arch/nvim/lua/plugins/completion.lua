return {
    {
        "L3MON4D3/LuaSnip",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        config = function()
            local luasnip = require("luasnip")

            luasnip.setup({
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,
            })

            -- Load friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Load custom VSCode-style snippets from ~/.config/nvim/snippets
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })

            -- Load custom SnipMate-style snippets from ~/.config/nvim/snippets
            require("luasnip.loaders.from_snipmate").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })

            -- Load custom Lua-style snippets from ~/.config/nvim/snippets
            require("luasnip.loaders.from_lua").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })

            -- Unlink snippet when leaving insert mode to prevent jumping to old snippets later
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*:n",
                callback = function()
                    if
                        luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
                        and not luasnip.session.jump_active
                    then
                        luasnip.unlink_current()
                    end
                end,
            })
        end,
    },

    {
        "hrsh7th/nvim-cmp",

        event = "InsertEnter",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),

                    ["<C-e>"] = cmp.mapping.abort(),

                    ["<CR>"] = cmp.mapping.confirm({
                        select = false,
                    }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    -- Dedicated snippet jump keys (work even when cmp popup is visible)
                    ["<C-l>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<C-h>"] = cmp.mapping(function(fallback)
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp", priority = 1000 },
                    { name = "luasnip", priority = 750 },
                    { name = "buffer", priority = 500 },
                    { name = "path", priority = 250 },
                }),

                formatting = {
                    format = function(entry, vim_item)
                        local source_names = {
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        }
                        vim_item.menu = source_names[entry.source.name]
                            or string.format("[%s]", entry.source.name)
                        return vim_item
                    end,
                },
            })
        end,
    },
}