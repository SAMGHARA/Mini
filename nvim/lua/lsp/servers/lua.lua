return {
    { "williamboman/mason.nvim", opts = function(_, opts) table.insert(opts, "lua-language-server") end },

    {
        "neovim/nvim-lspconfig",
        opts = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME }
                        }
                    }
                }
            }
        }
    }
}
