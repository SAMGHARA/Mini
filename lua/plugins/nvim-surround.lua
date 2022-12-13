local M = {
    "kylechui/nvim-surround"
}

M.setup = function()

end

M.config = function()
    local status, surround = pcall(require, "nvim-surround")
    if not status then
        return
    end

    surround.setup {}
end

return M
