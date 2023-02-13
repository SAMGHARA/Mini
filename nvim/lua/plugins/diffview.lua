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
    local keymaps = {
        { "n", "<leader>gl",   "<cmd>DiffviewLog<cr>"       },
        { "n", "<leader>go",   "<cmd>DiffviewOpen<cr>"      },
        { "n", "<leader>gc",   "<cmd>DiffviewClose<cr>"     },
        { "n", "<leader>gf", "<cmd>DiffviewFocusFiles<cr>"  },
        { "n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>" },
    }
    require("core").setKeyMaps(keymaps)
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
