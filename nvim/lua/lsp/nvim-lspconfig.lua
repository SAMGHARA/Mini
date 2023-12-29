local mason = {
    -- https://github.com/williamboman/mason.nvim
    "williamboman/mason.nvim",

    config = function(_, opts)
        require("mason").setup {}

        for _, lsp in ipairs(opts) do
            if not require("mason-registry").is_installed(lsp) then
                vim.api.nvim_command("MasonInstall " .. lsp)
            end
        end
    end
}

local lspconfig = {
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",

    dependencies = "williamboman/mason.nvim",
    init = function()
        local C = require("core.theme")
        require("core").setHighlights {
            ["DiagnosticError"]          = { guifg = C.DRed },
            ["DiagnosticUnderlineWarn"]  = { guifg = C.Yellow, gui = "underline" },
            ["DiagnosticUnderlineError"] = { guifg = C.DRed,   gui = "underline" },
        }

        require("core").setFileTypeCallBack("qf", function()
            local bn = vim.fn.bufnr('%')
            local OpenAndCloseQF = string.format("<CR><Cmd>%dbdelete<CR>", bn)
            require("core").setKeyMaps {
                { "n", "<CR>", OpenAndCloseQF, { buffer = bn } },
                { "n",  "o",   OpenAndCloseQF, { buffer = bn } },
                { "n",  "j",   "j<CR><C-w>j",  { buffer = bn } },
                { "n",  "k",   "k<CR><C-w>j",  { buffer = bn } },
            }
        end)

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
                        { "n", "v" }, "<M-F>", function() vim.lsp.buf.format { async = true } end,
                        { buffer = ev.buf, desc = "LSP: Formats a buffer" }
                    }
                }
            end,
        })
    end,
    config = function(_, lspopts)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        for lsp, opts in pairs(lspopts) do
            opts.capabilities = capabilities
            require("lspconfig")[lsp].setup(opts)
        end
    end
}

return {
    mason,
    lspconfig,
    require("lsp.servers.c"),
    require("lsp.servers.go"),
    require("lsp.servers.lua"),
    require("lsp.servers.cmake"),
}
