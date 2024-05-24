return {
    -- https://github.com/mg979/vim-visual-multi
    "mg979/vim-visual-multi",

    event = "VeryLazy",
    init = function()
        local options = {
            g = {
                VM_theme = "iceblue",
                VM_highlight_matches = "underline",
                VM_default_mappings = 0,
                VM_maps = {
                    ["Find Under"]      = "<C-n>",
                    ["Add Cursor Up"]   = "<C-k>", -- lua/plugins/coc.lua  { "n", <c-k>, ... }
                    ["Add Cursor Down"] = "<C-j>", -- lua/plugins/coc.lua  { "n", <c-j>, ... }
                    ["Remove Region"]   = "q",
                }
            }
        }
        require("core").setOptions(options)
    end
}
