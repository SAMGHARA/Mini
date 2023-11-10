-- https://github.com/numToStr/Comment.nvim
return {
    "numToStr/Comment.nvim",

    event = "VeryLazy",
    init = function()
        local keymaps = {
            {
                { "n", "i" },
                "<c-_>",
                "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>"
            },
            {
                "v",
                "<c-_>",
                "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"
            },
            {
                "i",
                "<a-s-a>",
                "<cmd>lua require('Comment.api').toggle.blockwise.current()<cr>"
            },
        }
        require("core").setKeyMaps(keymaps)
    end,
    config = function()
        require("Comment").setup {
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = false,
            ---Lines to be ignored while (un)comment
            ignore = nil,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = "//",
                ---Block-comment toggle keymap
                block = "<a-s-a>",
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = "//",
                ---Block-comment keymap
                block = "<a-s-a>",
            }
        }

        require("Comment.ft").set("tmux", "#%s")
    end
}
