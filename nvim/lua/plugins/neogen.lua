return {
    -- https://github.com/danymat/neogen
    "danymat/neogen",

    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
        {
            mode = "n", "<leader>ng", "<Cmd>lua require('neogen').generate()<CR>",
            noremap = true, silent = true, desc = "Neogen: generate annotations"
        }
    },
    init = function()
        --[[
            c/cpp Doxygen comments highlight

            ///[1] @[2]brief[3] this is a doxygen comment[4]
            ///
            /// @tparam[5] T template T
            /// @param[6] x[7] param x[8]
            /// @param y param y
            ///
            /// @return[9] int
            template<typename T>
            int func(T x, int y);
        --]]
        local C = require("core.theme")
        require("core").setHighlights {
            ["doxygenComment"]            = { guifg = C.Gray,   gui = C.Italic }, -- [1]doxygenStartL  /**/ -> doxygenStart
            ["doxygenSpecial"]            = { guifg = C.Purple, gui = C.Italic }, -- [2]
            ["doxygenParam"]              = { guifg = C.Purple, gui = C.Italic }, -- [6] [3]doxygenBriefWord [5]doxygenTParam [9]doxygenOther
            ["doxygenBrief"]              = { guifg = C.LGray,  gui = C.Italic }, -- [4]
            ["doxygenParamName"]          = { guifg = C.Red,    gui = C.Italic }, -- [7]
            ["doxygenSpecialOnelineDesc"] = { guifg = C.Gray,   gui = C.Italic }, -- [8]
        }
    end,
    config = function()
        local i = require("neogen.types.template").item
        require("neogen").setup {
            placeholders_hl = "none",
            snippet_engine = "luasnip",
            languages = {
                cpp = {
                    template = {
                        annotation_convention = "doxygen",
                        doxygen = {
                            { nil,         "/// @brief $1",    { no_results = true, type = { "func", "file", "class" } } },
                            -- { nil,         "/// ",             { no_results = true, type = { "func", "file", "class" } } },
                            { i.ClassName, "/// @class %s",    { type = { "class" } } },
                            { nil,         "/// @brief $1",    { type = { "func", "class", "type" } } },
                            -- { nil,         "/// ",             { type = { "func", "class", "type" } } },
                            { i.Tparam,    "/// @tparam %s $1" },
                            { i.Parameter, "/// @param %s $1" },
                            -- { nil,         "/// ",             { type = { "func", "class", "type" } } },
                            { i.Return,    "/// @return $1" },
                        }
                    }
                }
            }
        }
    end
}
