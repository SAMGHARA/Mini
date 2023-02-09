local M = {
    -- https://github.com/mg979/vim-visual-multi
    "mg979/vim-visual-multi"
}

M.setup = function()
    local options = {
        g = {
            VM_theme = "ocean",
            VM_highlight_matches = "underline",
            VM_default_mappings = 0,
            VM_maps = {
                ["Find Under"]      = "<c-n>",
                ["Add Cursor Up"]   = "<c-k>",
                ["Add Cursor Down"] = "<c-j>",
                ["Remove Region"]   = "q",
            }
        }
    }
    require("core").setOptions(options)
end

M.config = function()

end

return M
