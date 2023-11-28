return {
    -- https://github.com/ibhagwan/fzf-lua
    "ibhagwan/fzf-lua",

    keys = {
        { mode = "n", "\\",            "<Cmd>FzfLua builtin<CR>",      desc = "FZF"           },
        { mode = "n", "F",             "<Cmd>FzfLua files<CR>",        desc = "Find files"    },
        { mode = "n", "<C-f>",         "<Cmd>FzfLua lgrep_curbuf<CR>", desc = "Curbuf search" },
        { mode = "n", "<leader><C-f>", "<Cmd>FzfLua live_grep<CR>",    desc = "Global search" },
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
