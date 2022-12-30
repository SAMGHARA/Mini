local M = {
    "folke/which-key.nvim",

    keys = "<leader>"
}

M.setup = function()

end

M.config = function()
    local status, whichkey = pcall(require, "which-key")
    if not status then
        return
    end

    whichkey.setup {

    }
end

return M
