local M = {
    -- https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",

    cmd = "Telescope"
}

M.setup = function()
    local keymaps = {
        { "n", "T",             "<cmd>Telescope<cr>"            },
        { "n", "F",             "<cmd>Telescope find_files<cr>" },
        { "n", "<leader><c-f>", "<cmd>Telescope live_grep<cr>"  },
        { "n", "<c-f>",         "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
    }
    require("core").setKeyMaps(keymaps)
end

M.config = function()
    local status, telescope = pcall(require, "telescope")
    if not status then
        return
    end

    local actions = require("telescope.actions")
    telescope.setup {
        defaults = {
            default_mappings = {
                n = {
                    ["Q"]          = actions.close,
                    ["<Esc>"]      = actions.close,
                    ["<CR>"]       = actions.select_default,
                    ["j"]          = actions.move_selection_next,
                    ["k"]          = actions.move_selection_previous,
                    ["<Up>"]       = actions.move_selection_previous,
                    ["<Down>"]     = actions.move_selection_next,
                    ["<PageUp>"]   = actions.preview_scrolling_up,
                    ["<PageDown>"] = actions.preview_scrolling_down,
                },
                i = {
                    ["Q"]          = actions.close,
                    ["<CR>"]       = actions.select_default,
                    ["<a-j>"]      = actions.move_selection_next,
                    ["<a-k>"]      = actions.move_selection_previous,
                    ["<Up>"]       = actions.move_selection_previous,
                    ["<Down>"]     = actions.move_selection_next,
                    ["<PageUp>"]   = actions.preview_scrolling_up,
                    ["<PageDown>"] = actions.preview_scrolling_down,
                }
            }
        }
    }
end

return M
