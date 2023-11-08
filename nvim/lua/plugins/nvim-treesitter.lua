local treesitter = {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",

    event = "VeryLazy",
    build = ":TSUpdate",
    cmd = {
        "TSInstall",
        "TSBufEnable",
        "TSBufDisable",
        "TSEnable",
        "TSDisable",
        "TSModuleInfo",
    },
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "c", "cpp", "go", "lua", "markdown", "markdown_inline" },
            sync_install = false,
            highlight = { enable = true, }
        }
    end
}

local playground = {
    -- https://github.com/nvim-treesitter/playground
    "nvim-treesitter/playground",

    keys = { { mode = "n", "<F2>", "<cmd>TSHighlightCapturesUnderCursor<cr>" } }
}

return { treesitter, playground }
