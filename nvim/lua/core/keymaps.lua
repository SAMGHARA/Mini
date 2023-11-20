local smart_home = function()
    local feedkeys
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('^[ \t]+$') then
        -- move cursor to the real beginning of the line
        feedkeys = "<Home>"
    else
        -- move cursor to beginning of non-whitespace characters of the line
        if vim.api.nvim_get_mode().mode == "i" then feedkeys = "<C-o>^" else feedkeys = "^" end
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(feedkeys, true, false, true), "n", false)
end

local opts = { noremap = true, silent = true }

require("core").setKeyMaps {
    -- "i"                <M-o>        insert next line
    -- "i"                <M-S-o>      insert prev line
    -- "v"                u            transform to Lowercase
    -- "v"                U            transform to Uppercase
    { { "i", "v" },      "jk",         "<ESC>",             opts },
    { "t",               "jk",         "<C-\\><C-n>",       opts }, -- in terminal switch TERMINAL mode to NORMAL mode
    { { "n", "i", "v" }, "<Home>",     smart_home,          opts },
    { { "n", "i", "v" }, "<M-b>",      smart_home,          opts },
    { { "n", "i", "v" }, "<M-e>",      "<End>",             opts },
    { { "n", "i" },      "<C-s>",      "<Cmd>w<CR>",        opts },
    { { "n", "i" },      "<C-z>",      "<Cmd>undo<CR>",     opts },
    { { "n", "i" },      "<C-y>",      "<Cmd>redo<CR>",     opts },
    { "v",               "<tab>",      ">gv",               opts },
    { "v",               "<S-tab>",    "<gv",               opts },
    { "i",               "<S-tab>",    "<C-d>",             opts },
    { "i",               "<M-h>",      "<left>",            opts },
    { "i",               "<M-j>",      "<down>",            opts }, -- lua/plugins/coc.lua set another keymap
    { "i",               "<M-k>",      "<up>",              opts }, -- lua/plugins/coc.lua set another keymap
    { "i",               "<M-l>",      "<right>",           opts },
    { "n",               "C",          ":",                 opts },
    { "n",               "<leader>w",  "<Cmd>w<CR>",        opts },
    { "n",               "<leader>q",  "<Cmd>qa<CR>",       opts },
    { "n",               "<leader>h",  "gd",                opts },
    { "n",               "<leader>nh", "<Cmd>noh<CR>",      opts },
    { "n",               "<C-a>",      "ggVG",              opts }, -- VISUAL mode select all
    { "n",               "<C-d>",      "viw",               opts }, -- VISUAL mode select current word
    { "n",               "<C-v>",      "p",                 opts },
    { "v",               "<C-v>",      "pgvy",              opts },
    { "v",               "p",          "pgvy",              opts },
    { "v",               "<C-x>",      "d",                 opts },
    { "v",               "<C-c>",      "y",                 opts },
    { "n",               "<M-a>",      "<C-o>",             opts },
    { "n",               "<M-d>",      "<C-i>",             opts },
    { { "n", "t" },      "<C-left>",   "<Cmd>wincmd h<CR>", opts },
    { { "n", "t" },      "<C-down>",   "<Cmd>wincmd j<CR>", opts },
    { { "n", "t" },      "<C-up>",     "<Cmd>wincmd k<CR>", opts },
    { { "n", "t" },      "<C-right>",  "<Cmd>wincmd l<CR>", opts },
    { "n",               "<M-j>",      ":move .+1<CR>",     opts }, -- move current line down
    { "n",               "<M-k>",      ":move .-2<CR>",     opts }, -- move current line up
    { "n",               "<M-S-j>",    ":copy .<CR>",       opts }, -- copy current line down
    { "n",               "<M-S-k>",    ":copy .-1<CR>",     opts }, -- copy current line up
    { "v",               "<M-j>",      ":move '>+1<CR>gv",  opts }, -- move select block down
    { "v",               "<M-k>",      ":move '<-2<CR>gv",  opts }, -- move select block up
    { "v",               "<M-S-j>",    ":copy '<-1<CR>gv",  opts }, -- copy select block down
    { "v",               "<M-S-k>",    ":copy '><CR>gv",    opts }, -- copy select block up
}
