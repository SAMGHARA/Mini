local M = {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    "lukas-reineke/indent-blankline.nvim",

    after = "nvim-treesitter"
}

M.setup = function()
    vim.wo.colorcolumn = "99999"
end

M.config = function()
    local status, indent_blankline = pcall(require, "indent_blankline")
    if not status then
        return
    end

    indent_blankline.setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_trailing_blankline_indent = false,
        char_highlight_list = {
            "IndentBlanklineChar"
        },
        context_highlight_list = {
            "IndentBlanklineContextChar"
        }
    }
end

return M
