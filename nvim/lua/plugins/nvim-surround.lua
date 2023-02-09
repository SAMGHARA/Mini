local M = {
    -- https://github.com/kylechui/nvim-surround
    "kylechui/nvim-surround"
}

-- ( [ {    ===>    (  ) [  ] {  }
-- ) ] }    ===>    () [] {}
M.setup = function()

end

M.config = function()
    local status, surround = pcall(require, "nvim-surround")
    if not status then
        return
    end

    surround.setup {
        keymaps = {
            normal = "ys",
            normal_cur = "yss",
            normal_line = "yS",
            normal_cur_line = "ySS",
            visual = "S",
            visual_line = "gS",
            delete = "ds",
            change = "cs"
        }
    }
end

return M
