local Utils = {
    SmartHome = function()
        local feedkeys
        local _, col = unpack(vim.api.nvim_win_get_cursor(0))
        if col == 0 or vim.api.nvim_get_current_line():sub(0, col):match('^[ \t]+$') then
            -- move cursor to the real beginning of the line
            feedkeys = "<Home>"
        else
            -- move cursor to beginning of non-whitespace characters of the line
            if vim.api.nvim_get_mode().mode == "i" then feedkeys = "<C-o>^" else feedkeys = "^" end
        end
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(feedkeys, true, false, true), "n", false)
    end,
    Comment = require("utils.comment")
}

return Utils
