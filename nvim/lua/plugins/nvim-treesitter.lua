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
            ensure_installed = {
                "lua", "cpp", "go",
                "bash", "cmake", "yaml",
                "markdown", "markdown_inline",
            },
            sync_install = false,
            highlight = {
                enable = true,
                disable = { "lua", "cpp" }, -- treesitter doesn't support cpp doxygen comment highlight
            }
        }
    end
}

local playground = {
    -- https://github.com/nvim-treesitter/playground
    "nvim-treesitter/playground",

    -- https://github.com/nvim-treesitter/nvim-treesitter
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
        { mode = "n", "<F2>", "<Cmd>TSHighlightCapturesUnderCursor<CR>" }
    }
}

return { treesitter, playground }
