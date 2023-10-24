-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
    "lukas-reineke/indent-blankline.nvim",

    commit = "4541d69",
    event = "VeryLazy",
    dependencies = "nvim-treesitter",
    -- main = "indent_blankline",
    opts = {
        space_char_blankline = " ",
        show_current_context = true,
        show_trailing_blankline_indent = false,
        char_highlight_list = { "IndentBlanklineChar" },
        context_highlight_list = { "IndentBlanklineContextChar" }
    }
}
