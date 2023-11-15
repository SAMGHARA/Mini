return {
    -- https://github.com/danymat/neogen
    "danymat/neogen",

    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
        { mode = "n", "<leader>ng", "<Cmd>lua require('neogen').generate()<CR>", { noremap = true, silent = true, desc = "Neogen: generate annotations" } }
    },
    config = function()
        local i = require("neogen.types.template").item
        require("neogen").setup {
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
