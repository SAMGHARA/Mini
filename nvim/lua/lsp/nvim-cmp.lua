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
            ["CmpItemAbbrMatch"]         = { guifg = C.Blue   },
            ["CmpItemAbbrDeprecated"]    = { guifg = C.Gray   },
            ["CmpItemAbbrMatchFuzzy"]    = { guifg = C.Blue   },
            ["CmpItemKindText"]          = { guifg = C.White  },
            ["CmpItemKindMethod"]        = { guifg = C.Purple },
            ["CmpItemKindFunction"]      = { guifg = C.Purple },
            ["CmpItemKindConstructor"]   = { guifg = C.Orange },
            ["CmpItemKindField"]         = { guifg = C.Orange },
            ["CmpItemKindVariable"]      = { guifg = C.White  },
            ["CmpItemKindClass"]         = { guifg = C.Yellow },
            ["CmpItemKindInterface"]     = { guifg = C.Purple },
            ["CmpItemKindModule"]        = { guifg = C.Yellow },
            ["CmpItemKindProperty"]      = { guifg = C.Orange },
            ["CmpItemKindUnit"]          = { guifg = C.Orange },
            ["CmpItemKindValue"]         = { guifg = C.Blue   },
            ["CmpItemKindEnum"]          = { guifg = C.Blue   },
            ["CmpItemKindKeyword"]       = { guifg = C.Purple },
            ["CmpItemKindSnippet"]       = { guifg = C.Yellow },
            ["CmpItemKindColor"]         = { guifg = C.Orange },
            ["CmpItemKindFile"]          = { guifg = C.Orange },
            ["CmpItemKindReference"]     = { guifg = C.Orange },
            ["CmpItemKindFolder"]        = { guifg = C.Orange },
            ["CmpItemKindEnumMember"]    = { guifg = C.Blue   },
            ["CmpItemKindConstant"]      = { guifg = C.Orange },
            ["CmpItemKindStruct"]        = { guifg = C.Yellow },
            ["CmpItemKindEvent"]         = { guifg = C.Orange },
            ["CmpItemKindOperator"]      = { guifg = C.Orange },
            ["CmpItemKindTypeParameter"] = { guifg = C.Purple },
        }
    end,
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local kinds = require('cmp.types').lsp.CompletionItemKind
        cmp.setup {
            sorting = {
                priority_weight = 2,
                comparators = {
                    function(entry1, entry2)
                        local kind1, kind2 = entry1:get_kind(), entry2:get_kind()
                        if kind1 ~= kind2 then
                            if kind1 == kinds.Field then
                                return true
                            end
                            if kind1 == kinds.Text or kind2 == kinds.Field then
                                return false
                            end
                        end
                    end,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.locality,
                    cmp.config.compare.length,
                }
            },
            preselect = cmp.PreselectMode.None,
            view = { docs = { auto_open = true } },
            window = { completion = { col_offset = 1, scrollbar = true, }, },
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
            sources = cmp.config.sources {
                { name = "luasnip"  },
                { name = "nvim_lsp" },
                { name = "path"     },
                { name = "buffer"   }
            },
            mapping = {
                ["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
                ["<Esc>"] = cmp.mapping(function(fallback)
                    return cmp.visible() and cmp.close() or fallback()
                end, { "i", "s" }),
                ["<M-j>"] = cmp.mapping(function()
                    return cmp.visible() and cmp.select_next_item() or luasnip.choice_active() and luasnip.change_choice(1)
                end, { "i", "s", "c" }),
                ["<M-k>"] = cmp.mapping(function()
                    return cmp.visible() and cmp.select_prev_item() or luasnip.choice_active() and luasnip.change_choice(-1)
                end, { "i", "s", "c" }),
                ["<M-n>"] = cmp.mapping(function()
                    return luasnip.expand_or_jumpable() and luasnip.expand_or_jump()
                end, { "i", "s" }),
                ["<M-p>"] = cmp.mapping(function()
                    return luasnip.jumpable(-1) and luasnip.jump()
                end, { "i", "s" }),
            },
            formatting = {
                fields = { "kind", "abbr" },
                format = function(_, item)
                    local width = 30
                    item.menu = ""
                    item.abbr = #item.abbr > width
                        and vim.fn.strcharpart(item.abbr, 0, width - 3) .. "..."
                        or item.abbr .. (" "):rep(width - #item.abbr)
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
