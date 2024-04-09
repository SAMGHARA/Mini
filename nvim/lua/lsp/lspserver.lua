local M = {
    -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
    servers = {
        "gopls",
        "clangd",
        "rust-analyzer",
        "lua-language-server",
        "cmake-language-server",
    }
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
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

    -- rust-analyzer
    -- https://www.andersevenrud.net/neovim.github.io/lsp/configurations/rust_analyzer/
    require 'lspconfig'.rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
            ['rust-analyzer'] = {
                cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    runBuildScripts = true,
                },
                checkOnSave = {
                    allFeatures = true,
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                },
                procMacro = {
                    enable = true,
                    ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" },
                    },
                },
            }
        }
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
