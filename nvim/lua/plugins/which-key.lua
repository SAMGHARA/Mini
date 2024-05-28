return {
    source = "https://github.com/folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            window = {
                border = "single"
            }
        }
    end
}
