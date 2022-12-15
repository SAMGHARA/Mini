local M = {
    "neoclide/coc.nvim",

    branch = "release",
    ft = { "c", "cpp", "lua", "go", "sh", "zsh", "json", "snippets" }
}

M.setup = function()
    vim.g.coc_global_extensions = {
        "coc-marketplace",
        "coc-snippets",
        "coc-word",
        "coc-json",
        "coc-sumneko-lua", "coc-clangd", "coc-go",
        "coc-webview", "coc-markdownlint", "coc-markdown-preview-enhanced"
    }

    local keymaps = {
        { "i", "<a-j>", [[coc#pum#visible() ? coc#pum#next(1) : "<down>"]],
            { silent = true, noremap = true, expr = true, replace_keycodes = false }, },
        { "i", "<a-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "<up>"  ]],
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },
        { "i", "<tab>", [[coc#pum#visible() ? coc#_select_confirm() : "\<c-g>u\<tab>\<c-r>=coc#on_enter()\<cr>"]],
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },

        { "i", "<c-j>", "<Plug>(coc-snippets-expand-jump)" },

        { "n", "<leader>d",  "<Plug>(coc-definition)",      { silent = true } },
        { "n", "<leader>s",  "<Plug>(coc-type-definition)", { silent = true } },
        { "n", "<leader>=",  "<Plug>(coc-diagnostic-next)", { silent = true } },
        { "n", "<leader>-",  "<Plug>(coc-diagnostic-prev)", { silent = true } },
        { "n", "<leader>rn", "<Plug>(coc-rename)",          { silent = true } },

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

        { { "n", "v" }, "<a-s-f>", "<Plug>(coc-format-selected)", { silent = true } },
    }

    require("core.keymaps").setKeyMap(keymaps)
end


M.config = function()

end

return M
