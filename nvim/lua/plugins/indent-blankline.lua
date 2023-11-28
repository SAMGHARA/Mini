return {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    "lukas-reineke/indent-blankline.nvim",

    event = "VeryLazy",
    -- commit = "4541d69",
    version = "2.20.8",
    init = function()
        local C = require("core.theme")
        require("core").setHighlights {
            ["IndentBlanklineChar"]        = { guifg = C.DGray, gui = "nocombine" },
            ["IndentBlanklineContextChar"] = { guifg = C.Gray,  gui = "nocombine" },
        }
    end,
    opts = {
        space_char_blankline = " ",
        show_current_context = true,
        show_trailing_blankline_indent = false,
        char_highlight_list = { "IndentBlanklineChar" },
        context_highlight_list = { "IndentBlanklineContextChar" }
    }
}
