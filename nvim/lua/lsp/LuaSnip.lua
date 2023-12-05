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
        -- Any directory that contains a `package.json` contributing snippets.
        require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/snippets/" } }
    end
}
