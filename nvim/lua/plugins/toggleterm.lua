-- https://github.com/akinsho/toggleterm.nvim
return {
    "akinsho/toggleterm.nvim",

    cmd = "ToggleTerm",
    keys = {
        { mode = "n", "<leader>t", "<cmd>ToggleTerm size=40 direction=float<cr>" },
        { mode = "t", "<leader>t", "<cmd>exit<cr>", }
    },
    opts = {
        open_mapping = [[<c-\>]],
        start_in_insert = true,
        insert_mappings = true,
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.3
            end
        end,
    }
}
