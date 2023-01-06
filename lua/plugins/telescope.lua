local M = {
    -- https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",

    cmd = "Telescope"
}

M.setup = function()
    local keymaps = {
        { "n", "F", "<cmd>Telescope find_files<cr>" }
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
            mappings = {
                n = {
                    ["Q"] = actions.close
                },
                i = {
                    ["Q"] = actions.close,
                }
            }
        }
    }
end

return M
