vim.g.colors_name = "onedark"

local C = {
    Red    = "#E06C75",
    DRed   = "#BD3D37",
    Orange = "#D19A66",
    Yellow = "#E5C07B",
    Green  = "#98C379",
    DGreen = "#109868",
    Cyan   = "#56B6C2",
    Blue   = "#61AFEF",
    Purple = "#C678DD",
    Gray   = "#5C6370",
    DGray  = "#3e4452",
    LGray  = "#ABB2BF",
    Black  = "#2c313c",
    White  = "#FFFFFF",
}

local highlights = {
    -- Core
    ["Normal"]                      = { fg = C.LGray  },
    ["Visual"]                      = { bg = C.DGray  },
    ["LineNr"]                      = { fg = C.Gray   },
    ["NonText"]                     = { fg = C.DGray  },
    ["CursorLine"]                  = { bg = C.DGray  },
    ["Title"]                       = { fg = C.Orange },
    ["Directory"]                   = { fg = C.Blue   },
    ["MatchParen"]                  = { bg = C.Gray   },
    ["PmenuSbar"]                   = { bg = C.DGray  },
    ["PmenuThumb"]                  = { bg = C.LGray  },
    ["Pmenu"]                       = { fg = C.LGray, bg = C.DGray  },
    ["PmenuSel"]                    = { fg = C.White, bg = C.Blue   },
    ["Search"]                      = { fg = C.Black, bg = C.Orange },
    ["Identifier"]                  = { fg = C.Red    },
    ["Boolean"]                     = { fg = C.Orange },
    ["Number"]                      = { fg = C.Orange },
    ["PreProc"]                     = { fg = C.Yellow },
    ["Type"]                        = { fg = C.Yellow },
    ["String"]                      = { fg = C.Green  },
    ["Character"]                   = { fg = C.Green  },
    ["Constant"]                    = { fg = C.Cyan   },
    ["Special"]                     = { fg = C.Blue   },
    ["Include"]                     = { fg = C.Blue   },
    ["Function"]                    = { fg = C.Blue   },
    ["Statement"]                   = { fg = C.Purple },
    ["Keyword"]                     = { fg = C.Purple },
    ["Conditional"]                 = { fg = C.Purple },
    ["Comment"]                     = { fg = C.Gray   },
    ["@none"]                       = { fg = C.LGray  },
    ["@namespace"]                  = { fg = C.Yellow },
    ["@parameter"]                  = { fg = C.Red    },
    -- Markdown
    ["@text.reference"]             = { fg = C.Blue   },
    ["@text.uri"]                   = { fg = C.Purple },
    ["@text.title"]                 = { fg = C.Red,   ui = "bold"   },
    ["@text.strong"]                = { fg = C.White, ui = "bold"   },
    ["@text.literal"]               = { fg = C.Green, ui = "italic" },
    ["@constant.builtin"]           = { fg = C.Orange },
    ["@punctuation.delimiter"]      = { fg = C.LGray  },
    -- coc
    ["DiagnosticError"]             = { fg = C.DRed   },
    ["DiagnosticUnderlineWarn"]     = { fg = C.Yellow, ui = "underline" }, -- CocWarningHighlight link to this
    ["DiagnosticUnderlineError"]    = { fg = C.DRed,   ui = "underline" }, -- CocErrorHighlight link to this
    ["DiffAdd"]                     = { fg = C.Black,  bg = C.Green     },
    ["DiffChange"]                  = { fg = C.Black,  bg = C.Yellow    },
    ["DiffDelete"]                  = { fg = C.Black,  bg = C.Red       },
    ["DiffText"]                    = { fg = C.Black,  bg = C.Red       },
    -- gitsigns
    ["GitSignsAdd"]                 = { fg = C.DGreen },
    ["GitSignsChange"]              = { fg = C.Orange },
    ["GitSignsDelete"]              = { fg = C.Red    },
    -- indent-blankline
    ["IndentBlanklineChar"]         = { fg = C.DGray, ui = "nocombine" },
    ["IndentBlanklineContextChar"]  = { fg = C.Gray,  ui = "nocombine" },
    -- todo-comments
    ["Todo"]                        = { fg = C.Black, bg = C.Blue },
    ["TodoFgTODO"]                  = { fg = C.Blue   },
    ["TodoBgTODO"]                  = { fg = C.Black, bg = C.Blue },
}

local highlights_link = {
    ["@variable"]                    = "Identifier",
    ["@storageclass"]                = "Keyword",
    ["@type.qualifier"]              = "Keyword",
    -- zsh
    ["zshVariable"]                  = "Identifier",
    ["zshOperator"]                  = "Operator",
    ["zshKSHFunction"]               = "Function",
    -- coc
    ["CocFadeOut"]                   = "Comment",
    ["CocFloating"]                  = "Pmenu",
    ["CocMenuSel"]                   = "PmenuSel",
    -- gitsigns
    ["GitSignsCurrentLineBlame"]     = "Comment",
    -- nvim-tree
    ["NvimTreeGitNew"]               = "GitSignsAdd",
    ["NvimTreeGitDirty"]             = "GitSignsChange",
    ["NvimTreeCursorLine"]           = "CursorLine",
    ["NvimTreeOpenedFolderIcon"]     = "NvimTreeOpenedFolderName",
    ["NvimTreeIndentMarker"]         = "IndentBlanklineContextChar",
}

local highlights_clear = {
    "SignColumn",
    "CursorLineNr",
    "StatusLine",
    "TabLineFill"
}

-- highlight
C.ui = "gui"
C.fg = "guifg"
C.bg = "guibg"
for group, args in pairs(highlights) do
    local command = string.format("highlight %s ", group)
    for arg, value in pairs(args) do
        command = command .. (C[arg] or arg) .. "=" .. value .. " "
    end
    vim.api.nvim_command(command)
end

-- highlight link
for group, link in pairs(highlights_link) do
    local command = string.format("highlight link %s %s", group, link)
    vim.api.nvim_command(command)
end

-- highlight clear
for _, group in pairs(highlights_clear) do
    vim.api.nvim_command("highlight clear " .. group)
end
