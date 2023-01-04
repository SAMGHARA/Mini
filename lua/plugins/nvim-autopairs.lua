local M = {
    -- https://github.com/windwp/nvim-autopairs
    "windwp/nvim-autopairs",

    event = "InsertEnter"
}

M.setup = function()

end

M.config = function()
    local status, autopairs = pcall(require, "nvim-autopairs")
    if not status then
        return
    end

    autopairs.setup {

    }
end

return M
