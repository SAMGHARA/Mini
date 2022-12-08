local M = {}

--[[
others:
    INSERT    <a-o>       insert next line
    INSERT    <a-s-o>     insert prev line
]]

M.coreMappings = {
    { { "n", "i", "v" }, "<c-b>", "<home>", { noremap = true, silent = true } }, -- Home
    { { "n", "i", "v" }, "<c-e>", "<end>",  { noremap = true, silent = true } }, -- End

    { { "n", "i" }, "<c-s>", "<cmd>w<cr>" },

    { { "n", "v"}, "<c-v>", "p" },

    { { "i", "v" }, "jk", "<esc>" },

    { "i", "<s-tab>", "<c-d>" }, -- see plugins/coc.lua/setup.keymaps

    -- move cursor in INSERT mode
    { "i", "<a-h>", "<left>",  { noremap = true, silent = true } },
    { "i", "<a-j>", "<down>",  { noremap = true, silent = true } },
    { "i", "<a-k>", "<up>",    { noremap = true, silent = true } },
    { "i", "<a-l>", "<right>", { noremap = true, silent = true } },

    { "n", "<leader>w",  "<cmd>w<cr>"   },
    { "n", "<leader>wq", "<cmd>wq<cr>"  },
    { "n", "<leader>qq", "<cmd>qa!<cr>" },

    { "n", "<c-z>", "u" },

    -- fast move cursor
    { "n", "<a-h>", "5h" },
    { "n", "<a-j>", "5j" },
    { "n", "<a-k>", "5k" },
    { "n", "<a-l>", "5l" },
    -- screen jump
    { "n", "<c-h>", "<c-w>h", { noremap = true, silent = true } },
    { "n", "<c-j>", "<c-w>j", { noremap = true, silent = true } },
    { "n", "<c-k>", "<c-w>k", { noremap = true, silent = true } },
    { "n", "<c-l>", "<c-w>l", { noremap = true, silent = true } },

    { "n", "<a-s-j>", "<cmd> copy .   <cr>" }, -- copy current line down
    { "n", "<a-s-k>", "<cmd> copy .-1 <cr>" }, -- copy current line up

    { "v", "<c-c>",   "y"   },
    { "v", "<tab>",   ">gv" },
    { "v", "<s-tab>", "<gv" },
    { "v", "<a-j>", ":move '>+1<cr>gv-gv" }, -- move select block down
    { "v", "<a-k>", ":move '<-2<cr>gv-gv" }, -- move select block up
}

M.setKeyMap = function(keymaps)
    for _, maps in pairs(keymaps) do
        local opts = {}
        if #maps >= 4 then
            opts = maps[4]
        end
        vim.keymap.set(maps[1], maps[2], maps[3], opts)
    end
end

M.setKeyMap(M.coreMappings)

return M
