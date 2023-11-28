return {
    -- https://github.com/akinsho/toggleterm.nvim
    "akinsho/toggleterm.nvim",

    keys = {
        -- { "n", "<leader>t", "<Cmd>ToggleTerm size=40 direction=float<CR>" },
        { mode = "n", "<leader>t", "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "ToggleTerm" },
    },
    opts = {
        open_mapping = [[<leader>t]],
        start_in_insert = true,
        insert_mappings = true,
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.3
            end
        end
    }
}
