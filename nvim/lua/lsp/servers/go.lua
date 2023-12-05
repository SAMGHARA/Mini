return {
    { "williamboman/mason.nvim", opts = function(_, opts) table.insert(opts, "gopls") end },

    {
        "neovim/nvim-lspconfig",
        opts = {
            gopls = {
                settings = {
                    gopls = {
                        gofumpt = true,
                        usePlaceholders = true,
                        completeUnimported = true,
                    }
                }
            }
        }
    }
}
