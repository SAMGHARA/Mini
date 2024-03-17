local C = function(cmd)
    return "<Cmd>lua require('fzf-lua')." .. cmd .. "({resume=true})<CR>"
end

return {
    -- https://github.com/ibhagwan/fzf-lua
    "ibhagwan/fzf-lua",

    keys = {
        { mode = "n", "\\",            C("builtin"),      desc = "FZF"           },
        { mode = "n", "F",             C("files"),        desc = "Find files"    },
        { mode = "n", "B",             C("buffers"),      desc = "Find buffers"  },
        { mode = "n", "<C-f>",         C("lgrep_curbuf"), desc = "Curbuf search" },
        { mode = "n", "<leader><C-f>", C("live_grep"),    desc = "Global search" },
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
