return {
    "ibhagwan/fzf-lua",

    cmd = "FzfLua",
    keys = {
        { "\\",    "<cmd>FzfLua builtin<cr>",      mode = "n" },
        { "F",     "<cmd>FzfLua files<cr>",        mode = "n" },
        { "<c-f>", "<cmd>FzfLua lgrep_curbuf<cr>", mode = "n" },
    },
    opts = {
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
                cmd = "git log --graph --color=always --date=format:'%m-%d'" ..
                " --pretty=format:'%C(yellow)%h%d %C(magenta)%cd %C(blue)%cn %C(white)%s %Creset'",
                preview = "git show --color=always {2} | $(git config pager.diff || echo 'cat')",
                -- actions = { ["default"] = require("fzf-lua.actions").dummy_abort }
            }
        },
        grep         = { rg_opts = "--column --no-heading --color=always --smart-case --max-columns=4096" }
    },
    config = function(_, opts)
        local actions = require("fzf-lua.actions")
        opts.git.actions = { ["default"] = actions.dummy_abort }

        require("fzf-lua").setup(opts)
    end
}
