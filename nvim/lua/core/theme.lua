local Core   = require "core"
local Colors = Core.colors

local highlights = {
    -- Core
    ["Normal"]      = { guifg = Colors.white  },
    ["Visual"]      = { guibg = Colors.black  },
    ["LineNr"]      = { guifg = Colors.grey   },
    ["NonText"]     = { guifg = Colors.grey2  },
    ["CursorLine"]  = { guibg = Colors.black2 },
    ["Title"]       = { guifg = Colors.orange },
    ["Directory"]   = { guifg = Colors.blue   },
    ["MatchParen"]  = { guibg = Colors.grey   },
    ["PmenuSbar"]   = { guibg = Colors.grey2  },
    ["PmenuThumb"]  = { guibg = Colors.white  },
    ["Pmenu"]       = { guifg = Colors.white,  guibg = Colors.grey2  },
    ["PmenuSel"]    = { guifg = Colors.white2, guibg = Colors.blue   },
    ["Search"]      = { guifg = Colors.black,  guibg = Colors.orange },
    ["Identifier"]  = { guifg = Colors.white  },
    ["Boolean"]     = { guifg = Colors.orange },
    ["Number"]      = { guifg = Colors.orange },
    ["PreProc"]     = { guifg = Colors.yellow },
    ["Type"]        = { guifg = Colors.yellow },
    ["String"]      = { guifg = Colors.green  },
    ["Character"]   = { guifg = Colors.green  },
    ["Constant"]    = { guifg = Colors.cyan   },
    ["Special"]     = { guifg = Colors.blue   },
    ["Include"]     = { guifg = Colors.blue   },
    ["Function"]    = { guifg = Colors.blue   },
    ["Statement"]   = { guifg = Colors.purple },
    ["Keyword"]     = { guifg = Colors.purple },
    ["Conditional"] = { guifg = Colors.purple },
    ["Comment"]     = { guifg = Colors.grey   },

    ["@field"]            = { guifg = Colors.red    },
    ["@variable"]         = { guifg = Colors.red    },
    ["@namespace"]        = { guifg = Colors.yellow },
    ["@parameter"]        = { guifg = Colors.red    },
    ["@text.literal"]     = { guifg = Colors.cyan   },
    ["@constant.builtin"] = { guifg = Colors.orange },

    ["@constructor"]           = { guifg = Colors.orange },
    ["@punctuation.bracket"]   = { guifg = Colors.orange },
    ["@punctuation.delimiter"] = { guifg = Colors.white  },

    -- Plugins
    -- bufferline
    ["BufferLineBufferSelected"]    = { gui = "bold,italic", guifg = Colors.cyan },
    ["BufferLineIndicatorSelected"] = { gui = "bold",        guifg = Colors.cyan },

    -- coc
    ["DiagnosticError"]          = { guifg = Colors.red2 },
    -- CocWarningHighlight link to this
    ["DiagnosticUnderlineWarn"]  = { gui = "underline", guifg = Colors.yellow },
    -- CocErrorHighlight link to this
    ["DiagnosticUnderlineError"] = { gui = "underline", guifg = Colors.red2   },

    ["DiffAdd"]        = { guifg = Colors.black2, guibg = Colors.green  },
    ["DiffChange"]     = { guifg = Colors.black2, guibg = Colors.yellow },
    ["DiffDelete"]     = { guifg = Colors.black2, guibg = Colors.red    },
    ["DiffText"]       = { guifg = Colors.black2, guibg = Colors.red    },

    -- gitsigns
    ["GitSignsAdd"]    = { guifg = Colors.green2 },
    ["GitSignsChange"] = { guifg = Colors.orange },
    ["GitSignsDelete"] = { guifg = Colors.red    },

    -- indent-blankline
    ["IndentBlanklineChar"]        = { gui = "nocombine", guifg = Colors.grey2 },
    ["IndentBlanklineContextChar"] = { gui = "nocombine", guifg = Colors.grey  },

    -- nvim-tree
    ["NvimTreeCursorLine"]       = { guifg = Colors.orange },
    ["NvimTreeOpenedFolderName"] = { guifg = Colors.orange },

    -- todo-comments
    ["Todo"]       = { guifg = Colors.black2, guibg = Colors.blue },
    ["TodoFgTODO"] = { guifg = Colors.blue },
    ["TodoBgTODO"] = { guifg = Colors.black2, guibg = Colors.blue },
}

local highlight_links = {
    ["@conceal"]        = "Comment",
    ["@storageclass"]   = "Keyword",
    ["@type.qualifier"] = "Keyword",

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
