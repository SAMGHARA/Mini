local M = {
    -- https://github.com/mg979/vim-visual-multi
    "mg979/vim-visual-multi"
}

M.setup = function()
    vim.g.VM_theme = "ocean"
    vim.g.VM_highlight_matches = "underline"
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
        ['Find Under']      = '<c-n>',
        ["Add Cursor Up"]   = "<c-up>",
        ["Add Cursor Down"] = "<c-down>",
        ["Remove Region"]   = "q",
    }
end

M.config = function()

end

return M
