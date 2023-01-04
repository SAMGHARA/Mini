local M = {
    -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",

    cmd = "TodoTelescope"
}

M.setup = function()
    local keymaps = {
        { "n", "T", "<cmd>TodoTelescope<cr>" }
    }
    require("core.keymaps").setKeyMap(keymaps)
end

M.config = function()
    local status, todo_comments = pcall(require, "todo-comments")
    if not status then
        return
    end

    todo_comments.setup {
    }
end

return M
