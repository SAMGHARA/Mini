local utils = require("utils")
local opts = { noremap = true, silent = true }

require("core").setKeyMaps {
    -- "i"                <M-o>        insert next line
    -- "i"                <M-O>        insert prev line
    -- "v"                u            transform to Lowercase
    -- "v"                U            transform to Uppercase
    { { "i", "v", "s" }, "jk",         "<Esc>",                   opts },
    { "t",               "jk",         "<C-\\><C-n>",             opts }, -- in terminal switch TERMINAL mode to NORMAL mode
    { { "n", "i", "v" }, "<Home>",     utils.SmartHome,           opts },
    { { "n", "i", "v" }, "<M-b>",      utils.SmartHome,           opts },
    { { "n", "i", "v" }, "<M-e>",      "<End>",                   opts },
    { { "n", "i" },      "<C-s>",      "<Cmd>w<CR>",              opts },
    { { "n", "i" },      "<C-z>",      "<Cmd>undo<CR>",           opts },
    { { "n", "i" },      "<C-y>",      "<Cmd>redo<CR>",           opts },
    { "v",               "<Tab>",      ">gv",                     opts },
    { "v",               "<S-Tab>",    "<gv",                     opts },
    { "i",               "<S-Tab>",    "<C-d>",                   opts },
    { "i",               "<M-h>",      "<Left>",                  opts },
    { "i",               "<M-l>",      "<Right>",                 opts },
    { "n",               "<leader>w",  "<Cmd>w<CR>",              opts },
    { "n",               "<leader>q",  "<Cmd>qa<CR>",             opts },
    { "n",               "<leader>h",  "gd",                      opts },
    { "n",               "<leader>nh", "<Cmd>noh<CR>",            opts },
    { "n",               "<C-a>",      "ggVG",                    opts }, -- VISUAL mode select all
    { "n",               "<C-d>",      "viw",                     opts }, -- VISUAL mode select current word
    { "n",               "<C-v>",      "p",                       opts },
    { "v",               "<C-v>",      "pgvy",                    opts },
    { "v",               "p",          "pgvy",                    opts },
    { "v",               "<C-x>",      "d",                       opts },
    { "v",               "<C-c>",      "y",                       opts },
    { "n",               "<M-a>",      "<C-o>",                   opts },
    { "n",               "<M-d>",      "<C-i>",                   opts },
    { { "n", "t" },      "<C-left>",   "<Cmd>wincmd h<CR>",       opts },
    { { "n", "t" },      "<C-down>",   "<Cmd>wincmd j<CR>",       opts },
    { { "n", "t" },      "<C-up>",     "<Cmd>wincmd k<CR>",       opts },
    { { "n", "t" },      "<C-right>",  "<Cmd>wincmd l<CR>",       opts },
    { "n",               "<M-j>",      ":move .+1<CR>",           opts }, -- move current line down
    { "n",               "<M-k>",      ":move .-2<CR>",           opts }, -- move current line up
    { "n",               "<M-J>",      ":copy .<CR>",             opts }, -- copy current line down
    { "n",               "<M-K>",      ":copy .-1<CR>",           opts }, -- copy current line up
    { "v",               "<M-j>",      ":move '>+1<CR>gv",        opts }, -- move select block down
    { "v",               "<M-k>",      ":move '<-2<CR>gv",        opts }, -- move select block up
    { "v",               "<M-J>",      ":copy '<-1<CR>gv",        opts }, -- copy select block down
    { "v",               "<M-K>",      ":copy '><CR>gv",          opts }, -- copy select block up
    { { "n", "i", "v" }, "<C-_>",      utils.Comment.CommentLine, opts }, -- line-comment
    { { "n", "i", "v" }, "<M-A>",      utils.Comment.CommentHunk, opts }, -- hunk-comment
}
