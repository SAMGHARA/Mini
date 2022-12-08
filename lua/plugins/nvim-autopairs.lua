local M = {
    "windwp/nvim-autopairs",

    event = {
        "InsertEnter" -- load this plugin while starting Insert mode
    }
}

M.setup = function()

end

M.config = function()
    local status, autopairs = pcall(require, "nvim-autopairs")
    if not status then
        return
    end

    autopairs.setup {
        map_cr = false,
        check_ts = true,
        ts_config = {
            lua = { "string", "source" },
            javascript = { "string", "template_string" },
            java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = 0, -- Offset from pattern match
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "PmenuSel",
            highlight_grey = "LineNr",
        },
    }
end

return M
