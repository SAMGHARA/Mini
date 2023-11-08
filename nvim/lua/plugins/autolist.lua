-- https://github.com/gaoDean/autolist.nvim
return {
    "gaoDean/autolist.nvim",

    ft = { "txt", "markdown" },
    config = function()
        require("autolist").setup()

        local keymaps = {
            { "n", "o", "o<cmd>AutolistNewBullet<cr>" },
            { "n", "O", "O<cmd>AutolistNewBulletBefore<cr>" },
        }
        require("core").setKeyMaps(keymaps)
    end
}
