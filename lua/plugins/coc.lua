local M = {
    -- https://github.com/neoclide/coc.nvim
    "neoclide/coc.nvim",

    branch = "release",
}

M.setup = function()
    vim.g.coc_global_extensions = {
        "coc-snippets",
        "coc-word",
        "coc-json",
        "coc-sumneko-lua", "coc-clangd", "coc-go",
        "coc-webview", "coc-markdownlint", "coc-markdown-preview-enhanced"
    }

    local keymaps = {
        { "i", "<a-j>", [[coc#pum#visible() ? coc#pum#next(1) : "<down>"]],
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },
        { "i", "<a-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "<up>"]],
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },
        { "i", "<tab>", [[coc#pum#visible() ? coc#_select_confirm() : "\<c-g>u\<tab>\<c-r>=coc#on_enter()\<cr>"]],
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },
        { "i", "<esc>", [[coc#pum#visible() ? coc#pum#cancel() : "<esc>"]],
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },

        { "n", "<c-j>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "<c-w>j"]],
            { silent = true, nowait = true, expr = true } },
        { "n", "<c-k>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "<c-w>k"]],
            { silent = true, nowait = true, expr = true } },
        { "i", "<c-j>", [[coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<c-j>"]],
            { silent = true, nowait = true, expr = true } },
        { "i", "<c-k>", [[coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<c-k>"]],
            { silent = true, nowait = true, expr = true } },
        { "v", "<c-j>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "<c-j>"]],
            { silent = true, nowait = true, expr = true } },
        { "v", "<c-k>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "<c-k>"]],
            { silent = true, nowait = true, expr = true } },

        { "n", "<leader>d",  "<Plug>(coc-definition)",      { silent = true } },
        { "n", "<leader>s",  "<Plug>(coc-type-definition)", { silent = true } },
        { "n", "<leader>i",  "<Plug>(coc-implementation)",  { silent = true } },
        { "n", "<leader>r",  "<Plug>(coc-references)",      { silent = true } },
        { "n", "<leader>rn", "<Plug>(coc-rename)",          { silent = true } },
        { "n", "<leader>cn", "<Plug>(coc-diagnostic-next)", { silent = true } },
        { "n", "<leader>cp", "<Plug>(coc-diagnostic-prev)", { silent = true } },
        { "v",  "<a-s-f>",   "<Plug>(coc-format-selected)", { silent = true } },

        -- coc-snippets
        { "i", "<a-n>", "<Plug>(coc-snippets-expand-jump)", { silent = true } },

        -- coc-markdown-preview-enhanced
        { "n", "<leader>cmp", "<cmd>CocCommand markdown-preview-enhanced.openPreview<cr>", { silent = true } },
        { "n", "<leader>cmt", "<cmd>CocCommand markdown-preview-enhanced.createTOC<cr>",   { silent = true } },

        { "n", "K", function()
                        local cw = vim.fn.expand('<cword>')
                        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                            vim.api.nvim_command('h ' .. cw)
                        elseif vim.api.nvim_eval('coc#rpc#ready()') then
                            vim.fn.CocActionAsync('doHover')
                        else
                            vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
                        end
                    end, { silent = true } },
    }
    require("core").setKeyMaps(keymaps)
end


M.config = function()

end

return M
