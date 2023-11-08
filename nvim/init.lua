require("core.options")
require("core.keymaps")

vim.cmd [[colorscheme onedark]]

local lazy = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy) then
    print("Installing Lazy.nvim ....")
    vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazy })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazy)

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { silent = true, desc = "Lazy" })

require("lazy").setup {
    spec = {
        require("plugins.autolist"),
        require("plugins.coc"),
        require("plugins.comment"),
        require("plugins.diffview"),
        require("plugins.flash"),
        require("plugins.fzf"),
        require("plugins.gitsigns"),
        require("plugins.indent-blankline"),
        require("plugins.lualine"),
        require("plugins.nvim-cmp"),
        require("plugins.nvim-surround"),
        require("plugins.nvim-tree"),
        require("plugins.nvim-treesitter"),
        require("plugins.smart-pairs"),
        require("plugins.todo-comments"),
        require("plugins.toggleterm"),
        require("plugins.vim-visual-multi"),
        require("plugins.which-key"),
    },
    defaults = { lazy = false },
    checker = { enabled = false },
    change_detection = { enabled = true, notify = false, },
    git = {
        log = { "-8" },
        timeout = 120,
        filter = true,
    },
    ui = {
        wrap = true,
        border = "single",
        icons = {
            cmd = "",
            config = "",
            event = "",
            ft = "",
            init = "",
            import = "",
            keys = "",
            lazy = "",
            loaded = "●",
            not_loaded = "○",
            plugin = "",
            runtime = "",
            require = "",
            source = "",
            start = "",
            task = "",
            list = { "", "", "", "", },
        }
    }
}
