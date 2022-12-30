local M = {
    "akinsho/toggleterm.nvim",

    cmd = "ToggleTerm"
}

M.setup = function()
    local keymaps = {
        { "n", "<leader>t", "<cmd>ToggleTerm size=40 direction=float<cr>" },
        { "t", "<leader>t", "<cmd>exit<cr>" }
    }
    require("core.keymaps").setKeyMap(keymaps)
end

M.config = function()
    local status, toggleterm = pcall(require, "toggleterm")
    if not status then
        return
    end

    toggleterm.setup({
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
    })
end

return M
