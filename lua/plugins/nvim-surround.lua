local M = {
    -- https://github.com/kylechui/nvim-surround
    "kylechui/nvim-surround"
}

-- Add Surround Character
-- NORMAL: ysiw + <surround character>
-- VISUAL:  S   + <surround character>

-- Change Surround Character
-- NORMAL:  cs  + <old surround character> <new surround character>
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
