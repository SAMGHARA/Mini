return {
    -- https://github.com/kylechui/nvim-surround
    "kylechui/nvim-surround",

    event = "VeryLazy",
    -- ( [ {    ===>    (  ) [  ] {  }
    -- ) ] }    ===>    () [] {}
    opts = {
        keymaps = {
            normal = "ys",
            visual = "S",
            delete = "ds",
            change = "cs"
        }
    }
}
