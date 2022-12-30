local M = {
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

    -- context indent-line color
    vim.cmd([[highlight IndentBlanklineChar guifg=#3b4048 gui=nocombine]])
    -- current_context indent-line color
    vim.cmd([[highlight IndentBlanklineContextChar guifg=#606368 gui=nocombine]])
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
