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
        textwidth      = 80
    },

    g = {
        encodings      = "UTF-8,GBK,GB2312",
        mapleader      = " ",
        maplocalleader = " ",
        completeopt    = "menu,menuone,noselect,noinsert"
    }
}

for type, opts in pairs(options) do
    for k, v in pairs(opts) do
        vim[type][k] = v;
    end
end

vim.opt.clipboard:prepend { "unnamed,unnamedplus" }

vim.cmd([[
let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
    \      '+': 'clip.exe',
    \      '*': 'clip.exe',
    \    },
    \   'paste': {
    \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \   },
    \   'cache_enabled': 0,
    \ }
]])

