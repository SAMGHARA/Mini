-- https://github.com/kylechui/nvim-surround
return {
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
