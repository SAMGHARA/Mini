local Core   = require "core"
local Colors = Core.colors

local highlights = {
    -- Core
    ["Normal"]      = { guifg = Colors.white },
    ["Visual"]      = { guibg = Colors.black },
    ["LineNr"]      = { guifg = Colors.grey },
    ["NonText"]     = { guifg = Colors.grey_dark },
    ["CursorLine"]  = { guibg = Colors.black_dark },
    ["Search"]      = { guifg = Colors.black, guibg = Colors.orange },
    ["Title"]       = { guifg = Colors.orange },
    ["Directory"]   = { guifg = Colors.blue },
    ["MatchParen"]  = { guibg = Colors.grey },
    ["PmenuSbar"]   = { guibg = Colors.grey_dark },
    ["PmenuThumb"]  = { guibg = Colors.white },
    ["Pmenu"]       = { guifg = Colors.white, guibg = Colors.grey_dark },
    ["PmenuSel"]    = { guifg = Colors.white_dark, guibg = Colors.blue },
    ["Identifier"]  = { guifg = Colors.red },
    ["Boolean"]     = { guifg = Colors.orange },
    ["Number"]      = { guifg = Colors.orange },
    ["PreProc"]     = { guifg = Colors.yellow },
    ["Type"]        = { guifg = Colors.yellow },
    ["String"]      = { guifg = Colors.green },
    ["Character"]   = { guifg = Colors.green },
    ["Constant"]    = { guifg = Colors.cyan },
    ["Special"]     = { guifg = Colors.blue },
    ["Include"]     = { guifg = Colors.blue },
    ["Function"]    = { guifg = Colors.blue },
    ["Statement"]   = { guifg = Colors.purple },
    ["Keyword"]     = { guifg = Colors.purple },
    ["Conditional"] = { guifg = Colors.purple },
    ["Comment"]     = { guifg = Colors.grey },

    ["@text.literal"] = { guifg = Colors.cyan },

    -- Plugins
    -- bufferline
    ["BufferLineBufferSelected"]    = { gui = "bold,italic", guifg = Colors.cyan },
    ["BufferLineIndicatorSelected"] = { gui = "bold", guifg = Colors.cyan },

    -- coc
    ["DiagnosticError"]          = { guifg = Colors.red_dark },
    -- CocWarningHighlight link to this
    ["DiagnosticUnderlineWarn"]  = { gui = "underline", guifg = Colors.yellow },
    -- CocErrorHighlight link to this
    ["DiagnosticUnderlineError"] = { gui = "underline", guifg = Colors.red_dark },

    ["DiffAdd"]        = { guifg = Colors.black_dark, guibg = Colors.green },
    ["DiffChange"]     = { guifg = Colors.black_dark, guibg = Colors.yellow },
    ["DiffDelete"]     = { guifg = Colors.black_dark, guibg = Colors.red },
    ["DiffText"]       = { guifg = Colors.black_dark, guibg = Colors.red },
    -- gitsigns
    ["GitSignsAdd"]    = { guifg = Colors.green_dark },
    ["GitSignsChange"] = { guifg = Colors.orange },
    ["GitSignsDelete"] = { guifg = Colors.red },

    -- indent-blankline
    ["IndentBlanklineChar"]        = { gui = "nocombine", guifg = Colors.grey_dark },
    ["IndentBlanklineContextChar"] = { gui = "nocombine", guifg = Colors.grey },

    -- nvim-tree
    ["NvimTreeCursorLine"] = { guifg = Colors.orange },
    ["NvimTreeOpenedFolderName"] = { guifg = Colors.orange },

    -- todo-comments
    ["Todo"] = { guifg = Colors.black_dark, guibg = Colors.blue },
    ["TodoFgTODO"] = { guifg = Colors.blue },
    ["TodoBgTODO"] = { guifg = Colors.black_dark, guibg = Colors.blue },
}

local highlight_links = {
    ["@conceal"] = "Comment",

    -- bufferline
    ["BufferLineBufferVisible"]      = "BufferLineBufferSelected",
    ["BufferLineDevIconLuaInactive"] = "BufferLineDevIconLuaSelected",

    -- coc
    ["CocFadeOut"]  = "Comment",
    ["CocFloating"] = "Pmenu",
    ["CocMenuSel"]  = "PmenuSel",

    -- gitsigns
    ["GitSignsCurrentLineBlame"] = "Comment",

    -- nvim-tree
    ["NvimTreeGitNew"]           = "GitSignsAdd",
    ["NvimTreeGitDirty"]         = "GitSignsChange",
    ["NvimTreeOpenedFolderIcon"] = "NvimTreeOpenedFolderName",
}

local highlight_clear = {
    "SignColumn",
    "CursorLineNr",

    -- bufferline
    "BufferlineFill",
}

Core.setHighlight(highlights)
Core.linkHighlight(highlight_links)
Core.clearHighlight(highlight_clear)
