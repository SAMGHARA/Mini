local M = {
    -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",

    cmd = "TodoTelescope"
}

M.setup = function()
    local keymaps = {
        { "n", "T", "<cmd>TodoTelescope<cr>" }
    }
    require("core").setKeyMaps(keymaps)
end

M.config = function()
    local status, todo_comments = pcall(require, "todo-comments")
    if not status then
        return
    end

    todo_comments.setup {
        highlight = {
            multiline = true, -- enable multine todo comments
            multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
            multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
            before = "", -- "fg" or "bg" or empty
            keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
            after = "fg", -- "fg" or "bg" or empty
            pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
            comments_only = false, -- uses treesitter to match keywords in comments only
            max_line_len = 400, -- ignore lines longer than this
            exclude = {}, -- list of file types to exclude highlighting
        }
    }
end

return M
