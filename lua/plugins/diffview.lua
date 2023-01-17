local M = {
    -- https://github.com/sindrets/diffview.nvim
    "sindrets/diffview.nvim",

    requires = "nvim-lua/plenary.nvim",
    cmd = {
        "DiffviewLog",
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewRefresh",
        "DiffviewFocusFiles",
        "DiffviewFileHistory",
        "DiffviewToggleFiles"
    }
}

M.setup = function()

end

M.config = function()
    local status, diffview = pcall(require, "diffview")
    if not status then
        return
    end

    diffview.setup {

    }
end

return M
