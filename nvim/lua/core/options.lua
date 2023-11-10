local options = {
    opt = {
        mouse          = "a",           -- mouse support
        number         = true,          -- show line number
        relativenumber = true,          -- show relative line number
        showmode       = false,         -- do not show mode on the last line(NORMAL INSERT ...)
        sidescrolloff  = 8,             --
        list           = true,          -- show 'space' 'tab' by ${listchars}
        listchars      = {
            space = ' ',                -- space
            tab   = '> ',               -- tab
            trail = '·',                -- trailing space
        },
        textwidth      = 160,           --
        showtabline    = 0,             --
        laststatus     = 0,             --
        timeoutlen     = 200,           -- <leader> timeout
        tabstop        = 4,             -- insert 4 spaces for a tab.
        shiftwidth     = 4,             -- the number of spaces insertede for each indentation.
        expandtab      = true,          -- convert tabs to spaces.
        smartindent    = true,          -- smarter indenting.
        cinkeys        = ":,0#,!<Tab>", -- cinkeys
        termguicolors  = true,          -- set term gui colors.
        cursorline     = true,          -- highlight the current line.
        writebackup    = false,         --
        signcolumn     = "yes",         -- always show the sign column.
        hlsearch       = true,          --
        incsearch      = true,          --
    },

    g = {
        fileencodings           = "UTF-8,GBK,GB2312", -- file encoding
        mapleader               = " ",
        maplocalleader          = " ",
        completeopt             = "menu,menuone,noselect,noinsert",
        loaded_netrw            = 1,
        loaded_netrwPlugin      = 1,
        loaded_perl_provider    = 0,
        loaded_ruby_provider    = 0,
        loaded_python3_provider = 0,
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
else -- TODO: How to determine current is WSL
    options.opt.clipboard = vim.opt.clipboard ^ { "unnamed,unnamedplus" }
    options.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
            ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
        },
        cache_enabled = 0,
    }
end

require("core").setOptions(options)

require("core").addFileTypes {
    pattern = {
        [".*%.snippets"] = "snippets",
    },
}
