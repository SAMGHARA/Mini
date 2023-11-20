return {
    -- https://github.com/mg979/vim-visual-multi
    "mg979/vim-visual-multi",

    event = "VeryLazy",
    init = function()
        local options = {
            g = {
                VM_theme = "ocean",
                VM_highlight_matches = "underline",
                VM_default_mappings = 0,
                VM_maps = {
                    ["Find Under"]      = "<c-n>",
                    ["Add Cursor Up"]   = "<c-k>", -- lua/plugins/coc.lua  { "n", <c-k>, ... }
                    ["Add Cursor Down"] = "<c-j>", -- lua/plugins/coc.lua  { "n", <c-j>, ... }
                    ["Remove Region"]   = "q",
                }
            }
        }
        require("core").setOptions(options)
    end
}
