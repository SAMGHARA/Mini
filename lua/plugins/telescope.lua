local M = {
    "nvim-telescope/telescope.nvim",

    cmd = "Telescope"
}

M.setup = function()
    local keymaps = {
        { "n", "F", "<cmd>Telescope find_files<cr>" }
    }
    require("core.keymaps").setKeyMap(keymaps)
end

M.config = function()
    local status, telescope = pcall(require, "telescope")
    if not status then
        return
    end

    local actions = require("telescope.actions")
    telescope.setup {
        defaults = {
            mappings = {
                n = {
                    ["<leader>q"] = actions.close
                },
                i = {
                    ["<leader>q"] = actions.close,
                }
            }
        }
    }
end

return M
