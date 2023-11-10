return {
    -- https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",

    build = "make install_jsregexp",
    config = function()
        -- Any directory that contains a `package.json` contributing snippets.
        require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/snippets/" } }
    end
}
