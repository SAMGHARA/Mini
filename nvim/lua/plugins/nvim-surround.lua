-- https://github.com/kylechui/nvim-surround
return {
    "kylechui/nvim-surround",

    -- ( [ {    ===>    (  ) [  ] {  }
    -- ) ] }    ===>    () [] {}
    opts = {
        keymaps = {
            normal = "ys",
            normal_cur = "yss",
            normal_line = "yS",
            normal_cur_line = "ySS",
            visual = "S",
            visual_line = "gS",
            delete = "ds",
            change = "cs"
        }
    }
}
