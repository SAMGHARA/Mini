return {
    -- https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",

    build = "make install_jsregexp",
    event = "InsertEnter",
    config = function()
        require("luasnip").setup {
            update_events = "TextChanged,TextChangedI",
            delete_check_events = "TextChanged",
        }
        vim.defer_fn(function() require("lsp.snippets") end, 2)
    end
}
