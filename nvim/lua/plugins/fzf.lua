return {
    -- https://github.com/ibhagwan/fzf-lua
    "ibhagwan/fzf-lua",

    keys = {
        { "\\",            "<cmd>FzfLua builtin<cr>",      mode = "n", desc = "FZF" },
        { "F",             "<cmd>FzfLua files<cr>",        mode = "n", desc = "Find files" },
        { "<c-f>",         "<cmd>FzfLua lgrep_curbuf<cr>", mode = "n", desc = "Curbuf search" },
        { "<leader><c-f>", "<cmd>FzfLua live_grep<cr>",    mode = "n", desc = "Global search" },
    },
    config = function()
        require("fzf-lua").setup {
            winopts      = {
                height = 0.95,
                width = 0.85,
                border = "single",
                preview = { default = "builtin", vertical = "right", horizontal = "right" },
            },
            builtin      = { winopts = { height = 0.80, width = 0.80 } },
            commands     = { winopts = { preview = { hidden = "hidden" } } },
            colorschemes = { live_preview = false },
            git          = {
                commits = {
                    cmd = "git log --graph --color=always --date=format:'%m-%d' --pretty=format:'%C(yellow)%h%d %C(magenta)%cd %C(blue)%cn %C(white)%s %Creset'",
                    preview = "git show --color=always {2} | $(git config pager.diff || echo 'cat')",
                },
                actions = { ["default"] = require("fzf-lua.actions").dummy_abort }
            },
            grep         = { rg_opts = "--column --no-heading --color=always --smart-case --max-columns=4096" }
        }
    end
}
