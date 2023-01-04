local M = {
    "ggandor/leap.nvim"
}

M.setup = function()
    local keymaps = {
        { "n", "<leader>j", "<Plug>(leap-forward-to)"  },
        { "n", "<leader>k", "<Plug>(leap-backward-to)" },
    }
    require("core.keymaps").setKeyMap(keymaps)

end

M.sonfig = function()

end

return M
