local mason = {
    -- https://github.com/williamboman/mason.nvim
    "williamboman/mason.nvim",

    config = function()
        require("mason").setup {
            github = { download_url_template = "https://github.com/%s/releases/download/%s/%s" }
        }

        for _, lsp in ipairs(require("lsp.lspserver").servers) do
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
            ["DiagnosticUnderlineWarn"]  = { guifg = C.Yellow, gui = C.Underline },
            ["DiagnosticUnderlineError"] = { guifg = C.DRed,   gui = C.Underline },
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
                "n", "<leader>le", vim.diagnostic.open_float,
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
                "n", "<leader>lq", vim.diagnostic.setloclist,
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
                        "n", "<leader>lD", vim.lsp.buf.definition,
                        { buffer = ev.buf, desc = "LSP: Jumps to the definition" }
                    },
                    {
                        "n", "<leader>ld", vim.lsp.buf.declaration,
                        { buffer = ev.buf, desc = "LSP: Jumps to the declaration" }
                    },
                    {
                        "n", "<leader>lr", vim.lsp.buf.references,
                        { buffer = ev.buf, desc = "LSP: List all the references" }
                    },
                    {
                        { "n", "v" }, "<leader>la", vim.lsp.buf.code_action,
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
    config = function()
        local lspconfig = require("lspconfig")
        require("lsp.lspserver").setup(lspconfig)
    end
}

return { mason, lspconfig }
