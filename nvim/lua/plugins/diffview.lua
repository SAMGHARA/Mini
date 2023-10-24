-- https://github.com/sindrets/diffview.nvim
return {
    "sindrets/diffview.nvim",

    dependencies = "nvim-lua/plenary.nvim",
    cmd = {
        "DiffviewLog",
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewRefresh",
        "DiffviewFocusFiles",
        "DiffviewFileHistory",
        "DiffviewToggleFiles"
    },
    keys = {
        { mode = "n", "<leader>gl", "<cmd>DiffviewLog<cr>" },
        { mode = "n", "<leader>go", "<cmd>DiffviewOpen<cr>" },
        { mode = "n", "<leader>gc", "<cmd>DiffviewClose<cr>" },
        { mode = "n", "<leader>gf", "<cmd>DiffviewFocusFiles<cr>" },
        { mode = "n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>" },
    },
    opts = {

    }
}
