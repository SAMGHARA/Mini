require("core.options")
require("core.keymaps")

vim.cmd [[colorscheme onedark]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing Lazy.nvim ....")
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

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
        require("plugins.nvim-surround"),
        require("plugins.nvim-tree"),
        require("plugins.nvim-treesitter"),
        require("plugins.smart-pairs"),
        require("plugins.todo-comments"),
        require("plugins.toggleterm"),
        require("plugins.vim-visual-multi"),
        require("plugins.which-key"),
    },
    defaults = { lazy = false, version = false, },
    checker = { enabled = false },
    change_detection = { enabled = true, notify = false, },
    git = {
        log = { "-8" },
        timeout = 120,
        filter = true,
    },
    ui = {
        wrap = true,
        border = "single"
    }
}
