local treesitter = {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",

    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "lua",
                "rust",
                "cpp", "doxygen",
                "go", "printf",
                "bash", "cmake", "yaml", "json5",
                "markdown", "markdown_inline",
            },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>"
                }
            }
        }
        vim.treesitter.language.register("json5", "json")
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
