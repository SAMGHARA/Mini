local M = {
    -- https://github.com/ZhiyuanLck/smart-pairs
    "ZhiyuanLck/smart-pairs",

    event = "InsertEnter"
}

M.setup = function()

end

M.config = function()
    local status, pairs = pcall(require, "pairs")
    if not status then
        return
    end

    pairs:setup({
    })
end

return M
