return {
    { "williamboman/mason.nvim", opts = function(_, opts) table.insert(opts, "clangd") end },

    {
        "neovim/nvim-lspconfig",
        opts = {
            clangd = { settings = {} }
        }
    }
}
