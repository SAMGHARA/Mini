return {
    -- https://github.com/gaoDean/autolist.nvim
    "gaoDean/autolist.nvim",

    ft = { "txt", "markdown" },
    config = function()
        require("autolist").setup()

        local keymaps = {
            { "n", "o", "o<Cmd>AutolistNewBullet<CR>" },
            { "n", "O", "O<Cmd>AutolistNewBulletBefore<CR>" },
        }
        require("core").setKeyMaps(keymaps)
    end
}
