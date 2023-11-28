return {
    -- https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",

    event = "VeryLazy",
    init = function()
        local C = require("core.theme")
        require("core").setHighlights {
            ["GitSignsAdd"]    = { guifg = C.DGreen },
            ["GitSignsChange"] = { guifg = C.Orange },
            ["GitSignsDelete"] = { guifg = C.Red    },
            ["DiffAdd"]        = { guifg = C.Black, guibg = C.Green  },
            ["DiffChange"]     = { guifg = C.Black, guibg = C.Yellow },
            ["DiffDelete"]     = { guifg = C.Black, guibg = C.Red    },
            ["DiffText"]       = { guifg = C.Black, guibg = C.Red    },
        }
        require("core").linkHighlights {
            ["GitSignsCurrentLineBlame"] = "Comment",
            ["gitcommitBlank"]           = "Normal",
            ["gitcommitSummary"]         = "Normal",
            ["gitcommitOverflow"]        = "Normal",
        }
        require("core").setKeyMaps {
            { "n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>",     { desc = "GitSigns: diffthis"     } },
            { "n", "<leader>gn", "<Cmd>Gitsigns next_hunk<CR>",    { desc = "GitSigns: next_hunk"    } },
            { "n", "<leader>gp", "<Cmd>Gitsigns prev_hunk<CR>",    { desc = "GitSigns: prev_hunk"    } },
            { "n", "<leader>gr", "<Cmd>Gitsigns reset_hunk<CR>",   { desc = "GitSigns: reset_hunk"   } },
            { "n", "<leader>gv", "<Cmd>Gitsigns preview_hunk<CR>", { desc = "GitSigns: preview_hunk" } },

        }
    end,
    opts = {
        signs                        = {
            add          = { text = "▌" },
            change       = { text = "▌" },
            delete       = { text = "▌" },
            topdelete    = { text = "▌" },
            changedelete = { text = "▌" },
            untracked    = { text = "▌" },
        },
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = { interval = 1000, follow_files = true },
        attach_to_untracked          = true,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = { virt_text = true, virt_text_pos = "eol", delay = 100, ignore_whitespace = false, },
        current_line_blame_formatter = "    <author> <committer_time:%R>: <summary>",
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = { border = "single", style = "minimal", relative = "cursor", row = 0, col = 1 },
        yadm                         = { enable = false }
    }
}
