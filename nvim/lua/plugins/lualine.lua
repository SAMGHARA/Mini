return {
    -- https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim",

    event  = "VeryLazy",
    config = function()
        local C = require("core.theme")
        require("lualine").setup {
            options = {
                theme = {
                    normal  = { a = { fg = C.DGray, bg = C.Green  }, b = { bg = C.DGray }, c = { bg = C.None } },
                    insert  = { a = { fg = C.DGray, bg = C.Blue   } },
                    visual  = { a = { fg = C.DGray, bg = C.Purple } },
                    replace = { a = { fg = C.DGray, bg = C.Red    } },
                },
                globalstatus = true,
                icons_enabled = false,
                section_separators = "",
                component_separators = "",
                always_divide_middle = false,
                refresh = { statusline = 500 },
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "", right = "" } } },
                lualine_b = {
                    { "branch",      separator = { right = "" } },
                    { "diff",        separator = { right = "" }, symbols = { added = "+", modified = "~", removed = "-" } },
                    { "diagnostics", separator = { right = "" }, symbols = { error = "Err.", warn = "War.", info = "Tip." } },
                },
                lualine_c = { "%=", { "filename", path = 1 } },
                lualine_x = { "filesize", { "filetype", icons_enabled = true }, "encoding", "fileformat" },
                lualine_y = { { "location", separator = { left = "" } }, { "progress", separator = { left = "", right = "" } } },
                lualine_z = {}
            },
        }
    end
}
