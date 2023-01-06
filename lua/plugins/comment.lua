local M = {
    -- https://github.com/numToStr/Comment.nvim
    "numToStr/Comment.nvim",

    ft = { "c", "cpp", "lua", "go", "sh", "zsh" }
}

M.setup = function()
    local keymaps = {
        -- NORMAL: Use 'Ctrl+/' or '//' to toggle currentline linewise
        --         Use 'alt+shift+a' to toggle currentline blockwise
        { "n",   "//",    "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>"  },
        { "n",  "<c-_>",  "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>"  },
        { "n", "<a-s-a>", "<cmd>lua require('Comment.api').toggle.blockwise.current()<cr>" },

        -- VISUAL: Use 'Ctrl+/' or '//' to toggle selection linewise
        --         Use 'alt+shift+a' to toggle selection blockwise
        { "v",   "//",    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"  },
        { "v",  "<c-_>",  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"  },
        { "v", "<a-s-a>", "<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>" },
    }
    require("core").setKeyMaps(keymaps)
end

M.config = function()
    local status, Comment = pcall(require, "Comment")
    if not status then
        return
    end

    Comment.setup {}
end

return M
