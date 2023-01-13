local Core = require "core"

local options = {
    opt = {
        fileencodings  = "UTF-8,GBK,GB2312", -- file encoding
        mouse          = "a",       -- mouse support
        number         = true,      -- line number
        relativenumber = true,
        showmode       = false,     -- show model
        sidescrolloff  = 8,
        list           = true,
        listchars      = { space = '·', tab = '> ' },
        colorcolumn    = "120",     -- column wrap
        showtabline    = 4,
        timeoutlen     = 200,       -- <leader> timeout
        tabstop        = 4,         -- insert 4 spaces for a tab.
        shiftwidth     = 4,         -- the number of spaces insertede for each indentation.
        expandtab      = true,      -- convert tabs to spaces.
        smartindent    = true,      -- smarter indenting.
        termguicolors  = true,      -- set term gui colors.
        cursorline     = true,      -- highlight the current line.
        writebackup    = false,
        signcolumn     = "yes",     -- always show the sign column.
        hlsearch       = true,
        incsearch      = true,
    },

    g = {
        encodings      = "UTF-8,GBK,GB2312",
        mapleader      = " ",
        maplocalleader = " ",
        completeopt    = "menu,menuone,noselect,noinsert"
    }
}

if vim.env.TMUX then
    options.opt.clipboard = vim.opt.clipboard ^ { "unnamed,unnamedplus" }
    options.g.clipboard = {
        name = "TmuxClipboard",
        copy = {
            ["+"] = "tmux load-buffer -w -",
            ["*"] = "tmux load-buffer -w -",
        },
        paste = {
            ["+"] = "tmux save-buffer -",
            ["*"] = "tmux save-buffer -",
        },
    }
end

Core.setOptions(options)

Core.addFileTypes({
    pattern = {
        ['.*%.snippets'] = 'snippets',
    },
})
