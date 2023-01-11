local M = {
    -- https://github.com/numToStr/Comment.nvim
    "numToStr/Comment.nvim",
}

M.setup = function()
    local keymaps = {
        { { "n", "i" }, "<c-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>" },
        { "v", "<c-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>" },
    }
    require("core").setKeyMaps(keymaps)
end

M.config = function()
    local status, Comment = pcall(require, "Comment")
    if not status then
        return
    end

    Comment.setup {
        ---Add a space b/w comment and the line
        padding = true,
        ---Lines to be ignored while (un)comment
        ignore = "^$",
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
    require("Comment.ft")
        .set("tmux", "#%s")
end

return M
