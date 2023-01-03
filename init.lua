require "core.options"
require "core.keymaps"

local packer_bootstrap = false
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compiled_lua = vim.fn.stdpath("config") .. '/plugin/packer_compiled.lua'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Installing Packer ...")
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.fn.system({ "rm", "-rf", compiled_lua })

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        print("Packer.nvim install failed. Please try again!")
    else
        print("Packer.nvim install successed")
    end

    packer_bootstrap = true
    vim.cmd [[packadd packer.nvim]]
end

local Packer = {}
Packer.config = {
    git = {
        clone_timeout = 6000,
        default_url_format = "git@github.com:%s"
    },
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

Packer.plugins = {
    -- don't know
    { "nvim-lua/plenary.nvim", module = "plenary" },
    -- packer
    { "wbthomason/packer.nvim" },
    -- icons
    { "kyazdani42/nvim-web-devicons" },
    -- test nvim startuptime
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    -- Theme
    require("core.theme"),
    -- status line
    require("plugins.lualine"),
    -- buffer line
    require("plugins.bufferline"),
    -- nvim file tree
    require("plugins.nvim-tree"),
    -- tagbar
    require("plugins.tagbar"),
    -- terminal
    require("plugins.toggleterm"),
    -- git status
    require("plugins.gitsigns"),
    -- blankline
    require("plugins.indent-blankline"),
    -- which-key
    require("plugins.which-key"),
    -- telescope
    require("plugins.telescope"),
    -- comment
    require("plugins.comment"),
    -- todo comment
    require("plugins.todo-comments"),
    -- autopairs
    require("plugins.nvim-autopairs"),
    -- surrounding delimiter pairs
    require("plugins.nvim-surround"),
    -- treesitter
    require("plugins.nvim-treesitter"),
    -- coc
    require("plugins.coc")
}

require("packer").startup({
    config = Packer.config,
    function(use)
        for _, i in pairs(Packer.plugins) do
            use(i)
        end
    end
})

if packer_bootstrap then
    require("packer").sync()
end
