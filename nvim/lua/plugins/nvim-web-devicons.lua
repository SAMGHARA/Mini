return {
    -- https://github.com/nvim-tree/nvim-web-devicons
    "kyazdani42/nvim-web-devicons",

    event = "VeryLazy",
    opts = {
        override = {
            ["md"]          = { icon = "", color = "#519aba", name = "Markdown"   },
            [".gitignore"]  = { icon = "", color = "#e64a19", name = "GitIgnore"  },
            [".gitmodules"] = { icon = "", color = "#e64a19", name = "GitModules" },
        }
    }
}
