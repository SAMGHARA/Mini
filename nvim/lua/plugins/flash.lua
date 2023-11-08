return {
    "folke/flash.nvim",

    -- event = "VeryLazy",
    keys = {
        { mode = { "n", "x", "o" }, "<leader>j", function() require("flash").jump() end, desc = "Flash" }
    }
}
