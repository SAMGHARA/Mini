local M = {
    -- https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",

    ft = "gitcommit"
}

M.setup = function()
    vim.api.nvim_create_autocmd({ "BufRead" }, {
        callback = function()
            vim.fn.system("git -C " .. vim.fn.expand "%:p:h" .. " rev-parse")
            if vim.v.shell_error == 0 then
                vim.schedule(function()
                    require("packer").loader "gitsigns.nvim"
                end)
            end
        end,
    })

    local keymaps = {
        { "n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>"},
        { "n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>"},
        { "n", "<leader>gv", "<cmd>Gitsigns preview_hunk<cr>"},
        { "n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>"},
        { "n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>"},
    }
    require("core.keymaps").setKeyMap(keymaps)
end

M.config = function()
    local status, gitsigns = pcall(require, "gitsigns")
    if not status then
        return
    end

    gitsigns.setup {
        signs               = {
            add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            untracked    = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        },
        signcolumn          = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl               = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl              = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff           = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir        = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked = true,

        current_line_blame  = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 100,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '    <author> <committer_time:%R>: <summary>',

        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)

        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },

        yadm = {
            enable = false
        },
    }
end

return M
