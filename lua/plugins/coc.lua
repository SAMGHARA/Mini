local M = {
    "neoclide/coc.nvim",

    branch = "release"
}

M.setup = function()
    vim.g.coc_global_extensions = {
        "coc-marketplace",
        "coc-snippets",
        "coc-pairs",
        "coc-word",
        "coc-json",
        "coc-sumneko-lua",
        "coc-clangd",
        "coc-webview", "coc-markdownlint", "coc-markdown-preview-enhanced"
    }

    local keymaps = {
        { "i", "<tab>", "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<tab>\" : coc#refresh()",
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },
        { "i", "<s-tab>", "coc#pum#visible() ? coc#pum#prev(1) : \"\\<c-d>\"",
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },
        { "i", "<cr>", "coc#pum#visible() ? coc#_select_confirm() : \"\\<c-g>u\\<cr>\\<c-r>=coc#on_enter()\\<cr>\"",
            { silent = true, noremap = true, expr = true, replace_keycodes = false } },

        { "n", "gd", "<Plug>(coc-definition)",      { silent = true } },
        { "n", "gs", "<Plug>(coc-type-definition)", { silent = true } },

        { { "n", "v" }, "<a-s-f>", "<Plug>(coc-format-selected)", { silent = true } },
    }

    require("core.keymaps").setKeyMap(keymaps)
end


M.config = function()

end

return M
