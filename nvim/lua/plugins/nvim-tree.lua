-- https://github.com/nvim-tree/nvim-tree.lua
return {
    "kyazdani42/nvim-tree.lua",

    event = "VeryLazy",
    keys = {
        { mode = "n", "<leader>e", "<cmd>NvimTreeFocus<cr>" },
        { mode = "n", "<leader>f", "<cmd>NvimTreeToggle<cr>" }
    },
    opts = {
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            local keymaps = {
                { "n", "o",             api.node.open.edit,               opts("Open") },
                { "n", "<cr>",          api.node.open.edit,               opts("Open") },
                { "n", "<2-LeftMouse>", api.node.open.edit,               opts("Open") },
                { "n", "q",             api.tree.close,                   opts("Close") },
                { "n", "<tab>",         api.node.open.preview,            opts("Open Preview") },
                { "n", "a",             api.fs.create,                    opts("Create") },
                { "n", "d",             api.fs.remove,                    opts("Delete") },
                { "n", "D",             api.fs.trash,                     opts("Trash") },
                { "n", "r",             api.fs.rename,                    opts("Rename") },
                { "n", "x",             api.fs.cut,                       opts("Cut") },
                { "n", "y",             api.fs.copy.node,                 opts("Copy") },
                { "n", "p",             api.fs.paste,                     opts("Paste") },
                { "n", "O",             api.tree.change_root_to_node,     opts("CD") },
                { "n", "P",             api.tree.change_root_to_parent,   opts("Up") },
                { "n", "R",             api.tree.reload,                  opts("Refresh") },
                { "n", "F",             api.live_filter.start,            opts("Filter") },
                { "n", "E",             api.tree.expand_all,              opts("Expand All") },
                { "n", "W",             api.tree.collapse_all,            opts("Collapse") },
                { "n", "H",             api.tree.toggle_help,             opts("Help") },
                { "n", "K",             api.node.show_info_popup,         opts("Info") },
                { "n", "I",             api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore") },
            };
            require("core").setKeyMaps(keymaps)
        end,
        disable_netrw = true,
        reload_on_bufenter = true,
        renderer = {
            group_empty = true,
            highlight_git = true,
            highlight_opened_files = "icon",
            root_folder_label = false,
            indent_markers = {
                enable = true,
                inline_arrows = true,
                icons = { corner = "└", edge = "│", item = "│", bottom = "─", none = " ", },
            },
            icons = {
                show = { modified = false },
                glyphs = {
                    git = {
                        unstaged = "●",
                        staged = "A",
                        unmerged = "!",
                        renamed = "R",
                        untracked = "?",
                        deleted = "-",
                        ignored = "◌",
                    }
                }
            }, 
            special_files = { "README.md", "readme.md", "Makefile", "CMakeLists.txt" },
        },
        update_focused_file = { enable = true, update_root = true },
        diagnostics = { enable = true, icons = { hint = "", info = "", warning = "", error = "", }, },
        actions = { expand_all = { exclude = { ".git", "build" } } },
        trash = { cmd = "gio trash" },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)

        local api = require("nvim-tree.api")
        api.events.subscribe(api.events.Event.FileCreated, function(file) vim.cmd("edit " .. file.fname) end)
    end
}
