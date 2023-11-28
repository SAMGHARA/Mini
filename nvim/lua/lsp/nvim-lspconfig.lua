local lspserver = {
    "lua_ls",
    "bashls",
    "clangd",
    "jsonls",
    "gopls",
}

local mason = {
    -- https://github.com/williamboman/mason-lspconfig.nvim
    "williamboman/mason-lspconfig.nvim",

    -- https://github.com/williamboman/mason.nvim
    dependencies = "williamboman/mason.nvim",
    config = function()
        require("mason").setup {}
        require("mason-lspconfig").setup { ensure_installed = lspserver }
    end
}

local lspconfig = {
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",

    dependencies = "williamboman/mason-lspconfig.nvim",
    init = function()
        local C = require("core.theme")
        require("core").setHighlights {
            ["DiagnosticError"]          = { guifg = C.DRed },
            ["DiagnosticUnderlineWarn"]  = { guifg = C.Yellow, gui = "underline" },
            ["DiagnosticUnderlineError"] = { guifg = C.DRed,   gui = "underline" },
        }

        require("core").setKeyMaps {
            {
                "n", "<space>le", vim.diagnostic.open_float,
                { desc = "LSP: Show diagnostics in a floating window" }
            },
            {
                "n", "<leader>ln", vim.diagnostic.goto_next,
                { desc = "LSP: Move to the next diagnostic" }
            },
            {
                "n", "<leader>lp", vim.diagnostic.goto_prev,
                { desc = "LSP: Move to the prev diagnostic" }
            },
            {
                "n", "<space>lq", vim.diagnostic.setloclist,
                { desc = "LSP: Add buffer diagnostics to the location list" }
            },
        }

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                require("core").setKeyMaps {
                    {
                        "n", "<leader>lk", vim.lsp.buf.hover,
                        { buffer = ev.buf, desc = "LSP: Show hover information" }
                    },
                    {
                        "n", "<leader>ld", vim.lsp.buf.definition,
                        { buffer = ev.buf, desc = "LSP: Jumps to the definition" }
                    },
                    {
                        "n", "<leader>lr", vim.lsp.buf.references,
                        { buffer = ev.buf, desc = "LSP: List all the references" }
                    },
                    {
                        { "n", "v" }, "<leader>lca", vim.lsp.buf.code_action,
                        { buffer = ev.buf, desc = "LSP: Code Action" }
                    },
                    {
                        "n", "<leader>rn", vim.lsp.buf.rename,
                        { buffer = ev.buf, desc = "LSP: Renames all references" }
                    },
                    {
                        "n", "<M-F>", function() vim.lsp.buf.format { async = true } end,
                        { buffer = ev.buf, desc = "LSP: Formats a buffer" }
                    }
                }
            end,
        })
    end,
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        for _, lsp in ipairs(lspserver) do
            local status, opts = pcall(require, "lsp." .. lsp)
            if not status then
                require("lspconfig")[lsp].setup { capabilities = capabilities }
            else
                opts.capabilities = capabilities
                require("lspconfig")[lsp].setup(opts)
            end
        end
    end
}

return { mason, lspconfig }
