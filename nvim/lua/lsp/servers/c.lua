return {
    { "williamboman/mason.nvim", opts = function(_, opts) table.insert(opts, "clangd") end },

    {
        "neovim/nvim-lspconfig",
        opts = {
            clangd = {
                cmd = { 'clangd', '--clang-tidy' },
                init_options = {
                    clangdFileStatus = true,
                    usePlaceholders = true,
                    completeUnimported = true,
                    semanticHighlighting = true,
                    snippetSupport = false,
                },
                settings = {}
            }
        }
    }
}
