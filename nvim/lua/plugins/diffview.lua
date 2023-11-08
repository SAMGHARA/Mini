-- https://github.com/sindrets/diffview.nvim
return {
    "sindrets/diffview.nvim",

    keys = {
        { mode = "n", "<leader>gl", "<cmd>DiffviewLog<cr>" },
        { mode = "n", "<leader>go", "<cmd>DiffviewOpen<cr>" },
        { mode = "n", "<leader>gc", "<cmd>DiffviewClose<cr>" },
        { mode = "n", "<leader>gf", "<cmd>DiffviewFocusFiles<cr>" },
        { mode = "n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>" },
    }
}
