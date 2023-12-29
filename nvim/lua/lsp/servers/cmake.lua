return {
    { "williamboman/mason.nvim", opts = function(_, opts) table.insert(opts, "cmake-language-server") end },

    {
        "neovim/nvim-lspconfig",
        opts = {
            cmake = {
                settings = {}
            }
        }
    }
}
