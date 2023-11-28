return {
    -- https://github.com/hrsh7th/nvim-cmp
    "hrsh7th/nvim-cmp",

    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
    },

    init = function()
        local C = require("core.theme")

        require("core").setHighlights {
            ["CmpItemAbbrMatch"]      = { guifg = C.Blue   },
            ["cmpitemkindkeyword"]    = { guifg = C.Orange },
            ["CmpItemKindVariable"]   = { guifg = C.White  },
            ["CmpItemKindFunction"]   = { guifg = C.Purple },
            ["CmpItemAbbrDeprecated"] = { guifg = C.Gray   },
        }
        require("core").linkHighlights {
            ["CmpItemKindText"]       = "CmpItemKindVariable",
            ["CmpItemKindUnit"]       = "CmpItemKindKeyword",
            ["CmpItemKindMethod"]     = "CmpItemKindFunction",
            ["CmpItemKindProperty"]   = "CmpItemKindKeyword",
            ["CmpItemKindInterface"]  = "CmpItemKindVariable",
            ["CmpItemAbbrMatchFuzzy"] = "CmpItemAbbrMatch",
        }
    end,
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local cmp_kinds = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        }

        cmp.setup {
            sorting = { priority_weight = 1 },
            view = { docs = { auto_open = true } },
            window = { completion = { col_offset = 1, scrollbar = true, }, },
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
            sources = cmp.config.sources {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" }
            },
            mapping = {
                ["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<A-j>"] = cmp.mapping.select_next_item(),
                ["<A-k>"] = cmp.mapping.select_prev_item(),
                ["<A-n>"] = cmp.mapping(
                    function(fallback) if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() else fallback() end end, { "i", "s" }
                ),
                ["<A-p>"] = cmp.mapping(
                    function(fallback) if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end end, { "i", "s" }
                ),
                ["<ESC>"] = cmp.mapping(
                    function(fallback) if cmp.visible() then cmp.close() else fallback() end end, { "i", "s" }
                ),
            },
            formatting = {
                fields = { "kind", "abbr" },
                format = function(_, item)
                    item.kind = string.format("%s %s", cmp_kinds[item.kind], item.kind)

                    local content_width = math.floor(vim.api.nvim_win_get_width(0) * 0.3)
                    if #item.abbr > content_width then
                        item.abbr = vim.fn.strcharpart(item.abbr, 0, content_width - 3) .. "..."
                    else
                        item.abbr = item.abbr .. (" "):rep(content_width - #item.abbr)
                    end
                    return item
                end,
            },
        }

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = "path" } },
                { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
            ),
            formatting = { fields = { "abbr" } }
        })
    end
}
