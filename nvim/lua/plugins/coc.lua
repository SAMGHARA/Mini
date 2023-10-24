-- https://github.com/neoclide/coc.nvim
return {
    "neoclide/coc.nvim",

    branch = "release",
    event  = { "BufAdd", "BufRead", "BufNewFile", },
    init   = function()
        vim.g.coc_global_extensions = {
            "coc-snippets",
            "coc-word",
            "coc-json",
            "coc-sumneko-lua",
            "coc-clangd",
            "coc-go",
            "coc-webview",
            "coc-markdownlint",
            "coc-markdown-preview-enhanced"
        }
        vim.api.nvim_create_augroup("CocGroup", {})
        vim.api.nvim_create_autocmd("User", {
            group = "CocGroup",
            pattern = "CocJumpPlaceholder",
            command = "call CocActionAsync('showSignatureHelp')",
            desc = "Update signature help on jump placeholder"
        })
    end,
    keys   = {
        -- Select the next completion item
        {
            mode = "i",
            "<a-j>",
            [[coc#pum#visible() ? coc#pum#next(1) : "<down>"]],
            silent = true,
            noremap = true,
            expr = true,
            replace_keycodes = false
        },
        -- Select the previous completion item
        {
            mode = "i",
            "<a-k>",
            [[coc#pum#visible() ? coc#pum#prev(1) : "<up>"]],
            silent = true,
            noremap = true,
            expr = true,
            replace_keycodes = false
        },
        -- Select and confirm completion
        {
            mode = "i",
            "<tab>",
            [[coc#pum#visible() ? coc#_select_confirm() : "<tab>"]],
            silent = true,
            noremap = true,
            expr = true,
            replace_keycodes = false
        },
        -- 1. Close popupmenu. 2. Close floatwindow.
        {
            mode = "i",
            "<esc>",
            [[coc#pum#visible() ? coc#pum#cancel() : coc#float#has_float() ? "<c-o>coc#float#close(vim.g.coc_last_float_win)" : "<esc>"]],
            silent = true,
            noremap = true,
            expr = true,
            replace_keycodes = false
        },
        -- 1. Scroll float window down. 2. Plugin: vim-visual-multi VM-Add-Cursor-Down
        {
            mode = "n",
            "<c-j>",
            [[coc#float#has_scroll() ? coc#float#scroll(1) : "<Plug>(VM-Add-Cursor-Down)"]],
            silent = true,
            nowait = true,
            expr = true,
            noremap = true,
            replace_keycodes = false
        },
        -- 1. Scroll float window up.   2. Plugin: vim-visual-multi VM-Add-Cursor-Up
        {
            mode = "n",
            "<c-k>",
            [[coc#float#has_scroll() ? coc#float#scroll(0) : "<Plug>(VM-Add-Cursor-Up)"]],
            silent = true,
            nowait = true,
            expr = true,
            noremap = true,
            replace_keycodes = false
        },
        {
            mode = "i",
            "<c-j>",
            [[coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<c-j>"]],
            silent = true,
            nowait = true,
            expr = true
        },
        {
            mode = "i",
            "<c-k>",
            [[coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<c-k>"]],
            silent = true,
            nowait = true,
            expr = true
        },
        {
            mode = "v",
            "<c-j>",
            [[coc#float#has_scroll() ? coc#float#scroll(1) : "<c-j>"]],
            silent = true,
            nowait = true,
            expr = true
        },
        {
            mode = "v",
            "<c-k>",
            [[coc#float#has_scroll() ? coc#float#scroll(0) : "<c-k>"]],
            silent = true,
            nowait = true,
            expr = true
        },
        {
            mode = "n",
            "<leader>d",
            "<Plug>(coc-definition)",
            silent = true
        },
        {
            mode = "n",
            "<leader>s",
            "<Plug>(coc-type-definition)",
            silent = true
        },
        {
            mode = "n",
            "<leader>i",
            "<Plug>(coc-implementation)",
            silent = true
        },
        {
            mode = "n",
            "<leader>r",
            "<Plug>(coc-references)",
            silent = true
        },
        -- Rename symbol under cursor to a new word by invoke
        {
            mode = "n",
            "<leader>rn",
            "<Plug>(coc-rename)",
            silent = true
        },
        -- Jump to next diagnostic position after current cursor position.
        {
            mode = "n",
            "<leader>cn",
            "<Plug>(coc-diagnostic-next)",
            silent = true
        },
        -- Jump to previous diagnostic position before current cursor position.
        {
            mode = "n",
            "<leader>cp",
            "<Plug>(coc-diagnostic-prev)",
            silent = true
        },
        -- Jump to the float window
        {
            mode = "n",
            "<leader>cj",
            "<Plug>(coc-float-jump)",
            silent = true
        },

        -- Format selected range
        {
            mode = "v",
            "<a-s-f>",
            "<Plug>(coc-format-selected)",
            silent = true
        },

        -- coc-snippets
        {
            mode = "i",
            "<a-n>",
            "<Plug>(coc-snippets-expand-jump)",
            silent = true
        },

        -- coc-markdown-preview-enhanced
        {
            mode = "n",
            "<leader>cmp",
            "<cmd>CocCommand markdown-preview-enhanced.openPreview<cr>",
            silent = true
        },
        {
            mode = "n",
            "<leader>cmt",
            "<cmd>CocCommand markdown-preview-enhanced.createTOC<cr>",
            silent = true
        },
        {
            mode = "n",
            "<leader>cc",
            "<cmd>CocConfig<cr>",
            silent = true
        },
        {
            mode = "n",
            "K",
            function()
                local cw = vim.fn.expand('<cword>')
                if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                    vim.api.nvim_command('h ' .. cw)
                elseif vim.api.nvim_eval('coc#rpc#ready()') then
                    vim.fn.CocActionAsync('doHover')
                else
                    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
                end
            end,
            silent = true
        },
    }
}
