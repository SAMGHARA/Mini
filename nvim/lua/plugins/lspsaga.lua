return {
    source = "https://github.com/nvimdev/lspsaga.nvim",
    depends = { "https://github.com/nvim-tree/nvim-web-devicons" },
    config = function()
        Core.linkHighlights {
            ["SagaVirtLine"]  = "IndentBlanklineChar",
            ["SagaInCurrent"] = "IndentBlanklineContextChar"
        }
        local function lspsaga(cmd) return string.format("<Cmd>Lspsaga %s<CR>", cmd) end
        Core.setKeyMaps {
            { "n", "K",          lspsaga("hover_doc"),                  { desc = "[lspsaga] Lsp hover"                             } },
            { "n", "gd",         lspsaga("goto_definition"),            { desc = "[lspsaga] Lsp goto_definition"                   } },
            { "n", "<leader>t",  lspsaga("term_toggle"),                { desc = "[lspsaga] Float terminal"                        } },
            { "n", "<leader>lf", lspsaga("finder"),                     { desc = "[lspsaga] Finder"                                } },
            { "n", "<leader>rn", lspsaga("rename"),                     { desc = "[lspsaga] Rename"                                } },
            { "n", "<leader>la", lspsaga("code_action"),                { desc = "[lspsaga] Code Action"                           } },
            { "n", "<leader>ln", lspsaga("diagnostic_jump_next"),       { desc = "[lspsaga] Jump to the next diagnostic"           } },
            { "n", "<leader>lp", lspsaga("diagnostic_jump_prev"),       { desc = "[lspsaga] Jump to the prev diagnostic"           } },
            { "n", "<leader>le", lspsaga("show_line_diagnostics"),      { desc = "[lspsaga] Show diagnostics in a floating window" } },
            { "n", "<leader>ll", lspsaga("show_workspace_diagnostics"), { desc = "[lspsaga] Show diagnostics in a floating window" } },
        }

        require("lspsaga").setup {
            ui = {
                border = "rounded",
                devicon = true,
                foldericon = true,
                title = true,
                expand = "⊞",
                collapse = "⊟",
                code_action = "💡",
                lines = { "└", "│", "│", "─", " " },
                kind = nil,
                button = { "", "" },
                imp_sign = "󰳛 ",
            },
            hover = {
                max_width = 0.9,
                max_height = 0.8,
                open_link = "gx",
                open_cmd = "!chrome",
            },
            diagnostic = {
                show_layout = "float",
                show_normal_height = 10,
                jump_num_shortcut = true,
                auto_preview = true,
                max_width = 0.8,
                max_height = 0.6,
                max_show_width = 0.9,
                max_show_height = 0.6,
                text_hl_follow = true,
                border_follow = true,
                wrap_long_lines = true,
                extend_relatedInformation = false,
                diagnostic_only_current = false,
                keys = {
                    exec_action = "o",
                    quit = "q",
                    toggle_or_jump = "<CR>",
                    quit_in_show = { "q", "<ESC>" },
                },
            },
            code_action = {
                num_shortcut = true,
                show_server_name = false,
                extend_gitsigns = false,
                only_in_cursor = true,
                max_height = 0.3,
                cursorline = true,
                keys = {
                    quit = "q",
                    exec = "<CR>",
                },
            },
            lightbulb = {
                enable = true,
                sign = true,
                debounce = 10,
                sign_priority = 40,
                virtual_text = false,
                enable_in_insert = true,
            },
            scroll_preview = {
                scroll_down = "<PageDown>",
                scroll_up = "<PageUp>",
            },
            request_timeout = 2000,
            finder = {
                max_height = 0.5,
                left_width = 0.3,
                methods = {},
                default = "ref+imp",
                layout = "float",
                silent = false,
                filter = {},
                fname_sub = nil,
                sp_inexist = false,
                sp_global = false,
                ly_botright = false,
                keys = {
                    shuttle = "e",
                    toggle_or_open = "o",
                    vsplit = "s",
                    split = "i",
                    tabe = "t",
                    tabnew = "r",
                    quit = "q",
                    close = "<C-c>k",
                },
            },
            definition = {
                width = 0.6,
                height = 0.5,
                save_pos = false,
                keys = {
                    edit = "<C-o>",
                    vsplit = "<C-v>",
                    split = "<C-x>",
                    tabe = "<C-t>",
                    tabnew = "<C-c>n",
                    quit = "q",
                    close = "<C-c>",
                },
            },
            rename = {
                in_select = true,
                auto_save = false,
                project_max_width = 0.5,
                project_max_height = 0.5,
                keys = {
                    quit = "<Esc>",
                    exec = "<CR>",
                    select = "x",
                },
            },
            symbol_in_winbar = {
                enable = true,
                separator = " › ",
                hide_keyword = false,
                ignore_patterns = nil,
                show_file = true,
                folder_level = 1,
                color_mode = true,
                dely = 300,
            },
            outline = {
                win_position = "right",
                win_width = 30,
                auto_preview = true,
                detail = true,
                auto_close = true,
                close_after_jump = false,
                layout = "normal",
                max_height = 0.5,
                left_width = 0.3,
                keys = {
                    toggle_or_jump = { "<CR>", "o" },
                    quit = "q",
                    jump = "e",
                },
            },
            callhierarchy = {
                layout = "float",
                left_width = 0.2,
                keys = {
                    edit = "e",
                    vsplit = "s",
                    split = "i",
                    tabe = "t",
                    close = "<C-c>k",
                    quit = "q",
                    shuttle = "[w",
                    toggle_or_req = "u",
                },
            },
            typehierarchy = {
                layout = "float",
                left_width = 0.2,
                keys = {
                    edit = "e",
                    vsplit = "s",
                    split = "i",
                    tabe = "t",
                    close = "<C-c>k",
                    quit = "q",
                    shuttle = "[w",
                    toggle_or_req = "u",
                },
            },
            implement = {
                enable = false,
                sign = true,
                lang = {},
                virtual_text = true,
                priority = 100,
            },
            beacon = {
                enable = true,
                frequency = 7,
            },
            floaterm = {
                height = 0.7,
                width = 0.7,
            },
        }
    end
}
