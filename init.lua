require "core.theme"
require "core.options"
require "core.keymaps"

local packer_bootstrap = false
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compiled_lua = vim.fn.stdpath("config") .. '/plugin/packer_compiled.lua'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Installing Packer ...")
    vim.fn.system({ "git", "clone", "--depth", "1", "git@github.com:wbthomason/packer.nvim", install_path })
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
    { "nvim-lua/plenary.nvim", module = "plenary" },
    { "wbthomason/packer.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    require("plugins.lualine"),
    require("plugins.bufferline"),
    require("plugins.nvim-tree"),
    require("plugins.tagbar"),
    require("plugins.toggleterm"),
    require("plugins.gitsigns"),
    require("plugins.indent-blankline"),
    require("plugins.which-key"),
    require("plugins.telescope"),
    require("plugins.comment"),
    require("plugins.todo-comments"),
    require("plugins.nvim-autopairs"),
    require("plugins.nvim-surround"),
    require("plugins.vim-visual-multi"),
    require("plugins.leap"),
    require("plugins.nvim-treesitter"),
    require("plugins.autolist"),
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
