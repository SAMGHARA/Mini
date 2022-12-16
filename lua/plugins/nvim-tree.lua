local M = {
    "kyazdani42/nvim-tree.lua",

    cmd = {
        "NvimTreeToggle",
        "NvimTreeFocus"
    }
}

M.setup = function()
    local keymaps = {
        { "n", "<leader>e", ":NvimTreeFocus<cr>" },
        { "n", "<leader>f", ":NvimTreeToggle<cr>" }
    }
    require("core.keymaps").setKeyMap(keymaps)
end

M.config = function()
    local status, nvim_tree = pcall(require, "nvim-tree")
    if not status then
        return
    end

    nvim_tree.setup {
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        view = {
            adaptive_size = true,
            width = 30,
            side = "left",
            hide_root_folder = true,
        },
        git = {
            enable = true,
            ignore = true,
        },
        filesystem_watchers = {
            enable = true,
        },
        actions = {
            open_file = {
                resize_window = true,
            },
            change_dir = {
                global = true,
                restrict_above_cwd = true
            }
        },
        renderer = {
            root_folder_modifier = ":t",
            icons = {
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        }
    }
end

return M
