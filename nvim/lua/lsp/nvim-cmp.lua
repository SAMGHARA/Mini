return {
    -- https://github.com/hrsh7th/nvim-cmp
    "hrsh7th/nvim-cmp",

    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        'saadparwaiz1/cmp_luasnip',
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup {
            sorting = { priority_weight = 1 },
            view = { docs = { auto_open = true } },
            window = {
                completion = { col_offset = 1, scrollbar = true, },
            },
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
            sources = cmp.config.sources {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" }
            },
            mapping = {
                ["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<A-j>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                ["<A-k>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                ["<ESC>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.close()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
            },
            formatting = {
                format = function(_, item)
                    -- Set the fixed width of the completion menu to 60 characters.
                    local fixed_width = 60

                    -- Set the fixed completion window width.
                    vim.o.pumwidth = fixed_width

                    -- Get the width of the current window.
                    local win_width = vim.api.nvim_win_get_width(0)

                    local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

                    if #item.abbr > max_content_width then
                        item.abbr = vim.fn.strcharpart(item.abbr, 0, max_content_width - 3) .. "..."
                    else
                        item.abbr = item.abbr .. (" "):rep(max_content_width - #item.abbr)
                    end
                    return item
                end,
            },
        }

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = 'path' } },
                { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
            )
        })
    end
}
