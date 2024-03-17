local M = {
    servers = {
        "gopls",
        "clangd",
        "lua-language-server",
        "cmake-language-server",
    }
}

M.setup = function(lspconfig)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- gopls
    lspconfig.gopls.setup {
        capabilities = capabilities,
        settings = {
            gopls = {
                gofumpt = true,
                usePlaceholders = true,
                completeUnimported = true,
            }
        }
    }

    -- clangd
    lspconfig.clangd.setup {
        -- on_init = function(client, _)
        --     if client.server_capabilities then
        --         client.server_capabilities.semanticTokensProvider = nil
        --     end
        -- end,
        cmd = { 'clangd', '--clang-tidy' },
        init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = false,
            snippetSupport = false,
        },
        capabilities = capabilities,
        settings = {}
    }

    -- lua-language-server
    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
            Lua = {
                semantic = { enable = false },
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME }
                }
            }
        }
    }

    -- cmake-language-server
    lspconfig.cmake.setup {
        capabilities = capabilities,
        settings = {}
    }
end

return M
