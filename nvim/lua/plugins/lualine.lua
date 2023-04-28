local M = {
    -- https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim"
}

M.setup = function()
    local keymaps = {
        { "n",   "Q",     "<cmd>bdelete<cr>"   },
        { "n", "<tab>",   "<cmd>bnext<cr>"     },
        { "n", "<s-tab>", "<cmd>bprevious<cr>" },
    }
    require("core").setKeyMaps(keymaps)
end

M.config = function()
    local status, lualine = pcall(require, "lualine")
    if not status then
        return
    end

    lualine.setup {
        options = {
            icons_enabled = true,
            theme = "onedark",
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                { 'branch',      color = { fg = '#56B6C2' } },
                { 'diff',        symbols = { added = '+', modified = '~', removed = '-' } },
                { 'diagnostics', symbols = { error = 'Err.', warn = 'War.' } }
            },
            lualine_c = { 'filesize', 'searchcount' },
            lualine_x = { 'encoding', { 'fileformat', icons_enabled = false }, 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        tabline = {
            lualine_a = {
                { 'buffers', filetype_names = { NvimTree = "NvimTree" }, symbols = { alternate_file = '' } }
            },
            lualine_y = { 'tabs' },
        },
    }
end
return M
