-- https://github.com/nvim-lualine/lualine.nvim
return {
    "nvim-lualine/lualine.nvim",

    event = "VeryLazy",
    keys = {
        { mode = "n", "Q",       "<cmd>bdelete<cr>",   desc = "Close buffer" },
        { mode = "n", "<tab>",   "<cmd>bnext<cr>",     desc = "Next buffer" },
        { mode = "n", "<s-tab>", "<cmd>bprevious<cr>", desc = "Prev buffer" },
    },
    opts = {
        options = {
            icons_enabled = false,
            -- theme = "codedark",
            component_separators = '|';
            section_separators = { left = '', right = '' },
            always_divide_middle = true,
            globalstatus = true,
            refresh = { statusline = 500, tabline = 500,
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                { 'branch',      color = { fg = '#56B6C2' } },
                { 'diff',        symbols = { added = '+', modified = '*', removed = '-' } },
                { 'diagnostics', symbols = { error = 'Err.', warn = 'War.', info = "Tips." } }
            },
            lualine_c = { 'filesize', 'searchcount' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        tabline = {
            lualine_a = {
                { 'buffers', filetype_names = { NvimTree = "NvimTree" }, symbols = { alternate_file = '' } }
            },
            lualine_y = { 'tabs' },
        }
    }
}
