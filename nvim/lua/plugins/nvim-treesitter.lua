return {
    {
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
                -- sync_install = true,

                -- Automatically install missing parsers when entering buffer
                -- auto_install = true,
                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    -- additional_vim_regex_highlighting = false,
                }
            }
        end
    },
    {
        -- https://github.com/nvim-treesitter/playground
        "nvim-treesitter/playground",

        cmd = "TSHighlightCapturesUnderCursor",
        keys = {
            { mode = "n", "<F2>", "<cmd>TSHighlightCapturesUnderCursor<cr>" }
        }
    }
}
