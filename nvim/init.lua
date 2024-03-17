require("core.theme")
require("core.options")
require("core.keymaps")

local lazy = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy) then
    print("Installing lazy.nvim ...")
    vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazy })
end
vim.opt.rtp:prepend(lazy)

require("lazy").setup {
    require("plugins.autolist"),
    require("plugins.flash"),
    require("plugins.fzf"),
    require("plugins.gitsigns"),
    require("plugins.indent-blankline"),
    require("plugins.lualine"),
    require("plugins.neogen"),
    require("plugins.nvim-surround"),
    require("plugins.nvim-tree"),
    require("plugins.nvim-treesitter"),
    require("plugins.nvim-web-devicons"),
    require("plugins.smart-pairs"),
    require("plugins.toggleterm"),
    require("plugins.vim-visual-multi"),
    require("plugins.which-key"),
    require("lsp.LuaSnip"),
    require("lsp.nvim-cmp"),
    require("lsp.nvim-lspconfig"),

    defaults = { lazy = false },
    checker = { enabled = false },
    change_detection = { enabled = true, notify = false, },
    git = { log = { "-8" }, timeout = 120, filter = true, },
    ui = {
        wrap = true,
        border = "single",
        rtp = {
            disabled_plugins = {
                "gzip", "tutor", "tohtml", "rplugin", "tarPlugin", "zipPlugin"
            }
        }
    }
}
