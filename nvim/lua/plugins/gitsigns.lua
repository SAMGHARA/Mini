-- https://github.com/lewis6991/gitsigns.nvim
return {
    "lewis6991/gitsigns.nvim",

    lazy = false,
    keys = {
        { mode = "n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>" },
        { mode = "n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>" },
        { mode = "n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>" },
        { mode = "n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>" },
        { mode = "n", "<leader>gv", "<cmd>Gitsigns preview_hunk<cr>" },
    },
    opts = {
        signs                        = {
            add          = { text = '▌' },
            change       = { text = '▌' },
            delete       = { text = '▌' },
            topdelete    = { text = '▌' },
            changedelete = { text = '▌' },
            untracked    = { text = '▌' },
        },
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = { interval = 1000, follow_files = true },
        attach_to_untracked          = true,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = { virt_text = true, virt_text_pos = 'eol', delay = 100, ignore_whitespace = false, },
        current_line_blame_formatter = '    <author> <committer_time:%R>: <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = { border = 'single', style = 'minimal', relative = 'cursor', row = 0, col = 1 },
        yadm                         = { enable = false }
    }
}
