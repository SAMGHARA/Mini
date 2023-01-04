local M = {
    -- https://github.com/nvim-tree/nvim-tree.lua
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
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        git = {
            enable = true,
            ignore = true,
        },
        view = {
            adaptive_size = true,
            width = 30,
            side = "left",
            hide_root_folder = true,
            mappings = {
                list = {
                    { key = "D",        action = ""                   },
                    { key = "f",        action = ""                   },
                    -- cd in the directory under the cursor
                    { key = "O",        action = "cd"                 },
                    -- navigate up to the parent directory of the current file/directory
                    { key = "B",        action = "dir_up"             },
                    -- close tree window
                    { key = "q",        action = "close"              },
                    -- collapse the whole tree
                    { key = "W",        action = "collapse_all"       },
                    -- expand the whole tree
                    { key = "E",        action = "expand_all"         },
                    -- open the file as a preview (keeps the cursor in the tree)
                    { key = "<tab>",    action = "preview"            },

                    -- add a file; leaving a trailing `/` will add a directory
                    { key = "a",        action = "create"             },
                    -- delete a file (will prompt for confirmation)
                    { key = "d",        action = "remove"             },
                    -- rename a file
                    { key = "r",        action = "rename"             },
                    -- add/remove file/directory to cut clipboard
                    { key = "x",        action = "cut"                },
                    -- add/remove file/directory to copy clipboard
                    { key = "c",        action = "copy"               },
                    -- paste from clipboard
                    { key = "p",        action = "paste"              },
                    -- copy name to system clipboard
                    { key = "y",        action = "copy_name"          },
                    -- copy relative path to system clipboard
                    { key = "Y",        action = "copy_path"          },
                    -- copy absolute path to system clipboard
                    { key = "gy",       action = "copy_absolute_path" },
                }
            }
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
        renderer = {
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

    require("nvim-tree.events").on_file_created(function(file) vim.cmd("edit " .. file.fname) end)
end

return M
