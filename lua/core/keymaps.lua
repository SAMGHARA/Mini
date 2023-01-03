--[[
others:
    INSERT    <a-o>       insert next line
    INSERT    <a-s-o>     insert prev line
]]

local coreMappings = {
    { { "n", "i", "v" }, "<a-b>", "<home>", { noremap = true, silent = true } },
    { { "n", "i", "v" }, "<a-e>", "<end>",  { noremap = true, silent = true } },

    { { "n", "i" }, "<c-s>",   "<cmd>w<cr>"  },
    { { "n", "i" }, "<c-z>", "<cmd>undo<cr>" },
    { { "n", "i" }, "<c-y>", "<cmd>redo<cr>" },

    { { "n", "v" }, "<c-v>", "p" },

    { { "i", "v" }, "jk", "<esc>" },

    { "i", "<s-tab>", "<c-d>" },
    { "i", "<a-h>",   "<left>",  { noremap = true, silent = true } },
    { "i", "<a-j>",   "<down>",  { noremap = true, silent = true } }, -- lua/plugins/coc.lua set another keymap
    { "i", "<a-k>",   "<up>",    { noremap = true, silent = true } }, -- lua/plugins/coc.lua set another keymap
    { "i", "<a-l>",   "<right>", { noremap = true, silent = true } },

    { "n", "<leader>w", "<cmd>w<cr>"  },
    { "n", "<leader>q", "<cmd>qa<cr>" },

    { "n", "<c-a>", "gg0vG" },  -- VISUAL mode select all file
    { "n", "<c-d>",  "viw"  },  -- VISUAL mode select current word

    { "n", "<a-a>", "<c-o>" },
    { "n", "<a-d>", "<c-i>" },

    { "n", "<a-h>", "5h" },
    { "n", "<a-j>", "5j" },
    { "n", "<a-k>", "5k" },
    { "n", "<a-l>", "5l" },

    { "n", "<c-h>", "<c-w>h", { noremap = true, silent = true } },
    { "n", "<c-j>", "<c-w>j", { noremap = true, silent = true } },
    { "n", "<c-k>", "<c-w>k", { noremap = true, silent = true } },
    { "n", "<c-l>", "<c-w>l", { noremap = true, silent = true } },

    { "n", "<a-s-j>", "<cmd>copy .<cr>"   }, -- copy current line down
    { "n", "<a-s-k>", "<cmd>copy .-1<cr>" }, -- copy current line up

    { "v", "<c-c>",    "y"  },
    { "v", "<tab>",   ">gv" },
    { "v", "<s-tab>", "<gv" },

    { "v", "<a-j>", ":move '>+1<cr>gv-gv" }, -- move select block down
    { "v", "<a-k>", ":move '<-2<cr>gv-gv" }, -- move select block up
}

local M = {}
M.setKeyMap = function(keymaps)
    for _, maps in pairs(keymaps) do
        local opts = {}
        if #maps >= 4 then
            opts = maps[4]
        end
        vim.keymap.set(maps[1], maps[2], maps[3], opts)
    end
end

M.setKeyMap(coreMappings)

return M
