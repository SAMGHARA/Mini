local M = {
    "ibhagwan/fzf-lua",

    cmd = "FzfLua"
}

M.setup = function()
    local keymaps = {
        { "n",   "\\",  "<cmd>FzfLua builtin<cr>"      },
        { "n",   "F",   "<cmd>FzfLua files<cr>"        },
        { "n", "<c-f>", "<cmd>FzfLua lgrep_curbuf<cr>" },
    }
    require("core").setKeyMaps(keymaps)
end

M.config = function()
    local fzf     = require("fzf-lua")
    local actions = require("fzf-lua.actions")

    fzf.setup {
        winopts = {
            height = 0.95, width = 0.85, border = "single",
            preview = { default = "builtin", vertical = "right", horizontal = "right" },
        },
        builtin  = { winopts = { height = 0.80, width = 0.80 } },
        commands = { winopts = { preview = { hidden = "hidden" } } },
        colorschemes = { live_preview = false },
        git = {
            commits = {
                cmd = "git log --graph --color=always --date=format:'%m-%d'" ..
                    " --pretty=format:'%C(yellow)%h%d %C(magenta)%cd %C(blue)%cn %C(white)%s %Creset'",
                preview = "git show --color=always {2} | $(git config pager.diff || echo 'cat')",
                actions = { ["default"] = actions.dummy_abort }
            }
        },
        grep = { rg_opts = "--column --no-heading --color=always --smart-case --max-columns=4096" }
    }
end
return M
