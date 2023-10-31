-- https://github.com/gaoDean/autolist.nvim
return {
    "gaoDean/autolist.nvim",

    ft = { "txt", "markdown" },
    keys = {
        { mode = "n", "o", "o<cmd>AutolistNewBullet<cr>"       },
        { mode = "n", "O", "O<cmd>AutolistNewBulletBefore<cr>" },
    },
    opts = {}
}
