require("core.options")
require("core.keymaps")

vim.cmd [[colorscheme onedark]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup {
    spec = {
        { import = "plugins" }
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
    },
    performance = {
        rtp = {
            disabled_plugins = {
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },
}
