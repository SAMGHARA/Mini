local Core = require "core"

--[[
    INSERT    <a-o>       insert next line
    INSERT    <a-s-o>     insert prev line

    VISUAL       u        transform to Lowercase
    VISUAL       U        transform to Uppercase
]]

local coreMappings = {
    -- { { "n", "i", "v" }, "<a-b>", "<home>", { noremap = true, silent = true } },
    -- { { "n", "i", "v" }, "<a-e>", "<end>",  { noremap = true, silent = true } },

    { { "n", "i" }, "<c-s>",   "<cmd>w<cr>"  },
    { { "n", "i" }, "<c-z>", "<cmd>undo<cr>" },
    { { "n", "i" }, "<c-y>", "<cmd>redo<cr>" },

    { { "i", "v" }, "jk", "<esc>" },

    { "i", "<s-tab>", "<c-d>" },

    { "i", "<a-h>", "<left>",  { noremap = true, silent = true } },
    { "i", "<a-j>", "<down>",  { noremap = true, silent = true } }, -- lua/plugins/coc.lua set another keymap
    { "i", "<a-k>", "<up>",    { noremap = true, silent = true } }, -- lua/plugins/coc.lua set another keymap
    { "i", "<a-l>", "<right>", { noremap = true, silent = true } },

    { "n", ";", ":"},

    { "n", "<leader>w", "<cmd>w<cr>"  },
    { "n", "<leader>q", "<cmd>qa<cr>" },

    { "n", "<leader>h",       "gd"      },
    { "n", "<leader>nh", "<cmd>noh<cr>" },

    { "n", "<c-a>", "ggVG" },  -- VISUAL mode select all
    { "n", "<c-d>", "viw"  },  -- VISUAL mode select current word
    { "n", "<c-v>", "p"    },

    { "n", "<a-a>", "<c-o>" },
    { "n", "<a-d>", "<c-i>" },

    { "n", "<leader><left>",  "<c-w>h", { noremap = true, silent = true } },
    { "n", "<leader><down>",  "<c-w>j", { noremap = true, silent = true } },
    { "n", "<leader><up>",    "<c-w>k", { noremap = true, silent = true } },
    { "n", "<leader><right>", "<c-w>l", { noremap = true, silent = true } },

    { "n", "<a-j>",   "<cmd>move .+1<cr>" },
    { "n", "<a-k>",   "<cmd>move .-2<cr>" },
    { "n", "<a-s-j>", "<cmd>copy .<cr>"   }, -- copy current line down
    { "n", "<a-s-k>", "<cmd>copy .-1<cr>" }, -- copy current line up

    { "v", "<c-x>",    "d"   },
    { "v", "<c-c>",    "y"   },
    { "v", "<c-v>",   "pgvy" },
    { "v",   "p",     "pgvy" },
    { "v", "<tab>",   ">gv"  },
    { "v", "<s-tab>", "<gv"  },

    { "v", "<a-j>", ":move '>+1<cr>gv-gv" }, -- move select block down
    { "v", "<a-k>", ":move '<-2<cr>gv-gv" }, -- move select block up

    { "v", "<a-s-j>", "y<esc>`><end>p"  }, -- copy select block down
    { "v", "<a-s-k>", "y<esc>`<<home>P" }, -- copy select block up
}

Core.setKeyMaps(coreMappings)
