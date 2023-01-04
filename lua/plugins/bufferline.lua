local M = {
    -- https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim"
}

M.setup = function()
    local keymaps = {
            { "n",     "Q",     "<cmd>bdelete<cr>" },
            { "n",   "<tab>",   "<cmd>BufferLineCycleNext<cr>" },
            { "n",  "<s-tab>",  "<cmd>BufferLineCyclePrev<cr>" },
    }
    require("core.keymaps").setKeyMap(keymaps)
end

M.config = function()
    local status, bufferline = pcall(require, "bufferline")
    if not status then
        return
    end

    bufferline.setup {
        options = {
            close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
            right_mouse_command = "",
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = false,
            show_tab_indicators = true,
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = "Directory",
                    text_align = "left",
                    padding = 1
                },
            },
            indicator = {
                icon = '▎',
                style = 'icon'
            },
            buffer_close_icon = '',
            modified_icon = "●",
            left_trunc_marker = "",
            right_trunc_marker = "",
        }
    }
end

return M
