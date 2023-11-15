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
    ["Normal"]                     = { guifg = C.LGray  },
    ["Visual"]                     = { guibg = C.DGray  },
    ["LineNr"]                     = { guifg = C.Gray   },
    ["NonText"]                    = { guifg = C.DGray  },
    ["CursorLine"]                 = { guibg = C.DGray  },
    ["Title"]                      = { guifg = C.Orange },
    ["Directory"]                  = { guifg = C.Blue   },
    ["MatchParen"]                 = { guibg = C.Gray   },
    ["PmenuSbar"]                  = { guibg = C.DGray  },
    ["PmenuThumb"]                 = { guibg = C.LGray  },
    ["Pmenu"]                      = { guifg = C.LGray, guibg = C.DGray  },
    ["PmenuSel"]                   = { guifg = C.White, guibg = C.Blue   },
    ["Search"]                     = { guifg = C.Black, guibg = C.Orange },
    ["Identifier"]                 = { guifg = C.Red    },
    ["Boolean"]                    = { guifg = C.Orange },
    ["Number"]                     = { guifg = C.Orange },
    ["PreProc"]                    = { guifg = C.Yellow },
    ["Type"]                       = { guifg = C.Purple },
    ["String"]                     = { guifg = C.Green  },
    ["Character"]                  = { guifg = C.Green  },
    ["Constant"]                   = { guifg = C.Cyan   },
    ["Special"]                    = { guifg = C.Blue   },
    ["Include"]                    = { guifg = C.Blue   },
    ["Function"]                   = { guifg = C.Blue   },
    ["Statement"]                  = { guifg = C.Purple },
    ["Keyword"]                    = { guifg = C.Purple },
    ["Conditional"]                = { guifg = C.Purple },
    ["Comment"]                    = { guifg = C.Gray   },

    -- lsp
    ["@lsp.type.namespace"]        = { guifg = C.Yellow },
    ["@lsp.type.class"]            = { guifg = C.Yellow },

    ["@none"]                      = { guifg = C.LGray  },
    ["@namespace"]                 = { guifg = C.Yellow },
    ["@parameter"]                 = { guifg = C.Red    },

    -- Markdown
    ["@text.reference"]            = { guifg = C.Blue   },
    ["@text.uri"]                  = { guifg = C.Purple },
    ["@text.title"]                = { guifg = C.Red,   gui = "bold"   },
    ["@text.strong"]               = { guifg = C.White, gui = "bold"   },
    ["@text.literal"]              = { guifg = C.Green, gui = "italic" },
    ["@constant.builtin"]          = { guifg = C.Orange },
    ["@punctuation.delimiter"]     = { guifg = C.LGray  },

    -- coc
    -- ["DiagnosticError"]             = { guifg = C.DRed   },
    -- ["DiagnosticUnderlineWarn"]     = { guifg = C.Yellow, ui = "underline" }, -- CocWarningHighlight link to this
    -- ["DiagnosticUnderlineError"]    = { guifg = C.DRed,   ui = "underline" }, -- CocErrorHighlight link to this
    -- ["DiffAdd"]                     = { guifg = C.Black,  guibg = C.Green     },
    -- ["DiffChange"]                  = { guifg = C.Black,  guibg = C.Yellow    },
    -- ["DiffDelete"]                  = { guifg = C.Black,  guibg = C.Red       },
    -- ["DiffText"]                    = { guifg = C.Black,  guibg = C.Red       },

    -- gitsigns
    ["GitSignsAdd"]                = { guifg = C.DGreen },
    ["GitSignsChange"]             = { guifg = C.Orange },
    ["GitSignsDelete"]             = { guifg = C.Red },

    -- indent-blankline
    ["IndentBlanklineChar"]        = { guifg = C.DGray, gui = "nocombine" },
    ["IndentBlanklineContextChar"] = { guifg = C.Gray, gui = "nocombine" },

    -- todo-comments
    ["Todo"]                       = { guifg = C.Black, guibg = C.Blue },
    ["TodoFgTODO"]                 = { guifg = C.Blue },
    ["TodoBgTODO"]                 = { guifg = C.Black, guibg = C.Blue },

    --[[
        c/cpp Doxygen comments highlight

        ///[1] @[2]brief[3] this is a doxygen comment[4]
        ///
        /// @tparam[5] T template T
        /// @param[6] x[7] param x[8]
        /// @param y param y
        ///
        /// @return[9] int
        template<typename T>
        int func(T x, int y);
    --]]
    ["doxygenComment"]            = { guifg = C.Gray,   gui = "italic" }, -- [1]doxygenStartL  /**/ -> doxygenStart
    ["doxygenSpecial"]            = { guifg = C.Purple, gui = "italic" }, -- [2]
    ["doxygenParam"]              = { guifg = C.Purple, gui = "italic" }, -- [6] [3]doxygenBriefWord [5]doxygenTParam [9]doxygenOther
    ["doxygenBrief"]              = { guifg = C.LGray,  gui = "italic" }, -- [4]
    ["doxygenParamName"]          = { guifg = C.Red,    gui = "italic" }, -- [7]
    ["doxygenSpecialOnelineDesc"] = { guifg = C.Gray,   gui = "italic" }, -- [8]
}

local highlights_link = {
    -- ["@variable"]                    = "Identifier",
    -- ["@storageclass"]                = "Keyword",
    -- ["@type.qualifier"]              = "Keyword",

    -- zsh
    ["zshVariable"]              = "Identifier",
    ["zshOperator"]              = "Operator",
    ["zshKSHFunction"]           = "Function",

    -- coc
    -- ["CocFadeOut"]                   = "Comment",
    -- ["CocFloating"]                  = "Pmenu",
    -- ["CocMenuSel"]                   = "PmenuSel",

    -- gitsigns
    ["GitSignsCurrentLineBlame"] = "Comment",

    -- nvim-tree
    ["NvimTreeGitNew"]           = "GitSignsAdd",
    ["NvimTreeGitDirty"]         = "GitSignsChange",
    ["NvimTreeCursorLine"]       = "CursorLine",
    ["NvimTreeOpenedFolderIcon"] = "NvimTreeOpenedFolderName",
    ["NvimTreeIndentMarker"]     = "IndentBlanklineContextChar",

    -- lsp
    ["luaFunc"] = "Function",

    -- gitcommit
    ["gitcommitBlank"] = "Normal",
    ["gitcommitSummary"] = "Normal",
    ["gitcommitOverflow"] = "Normal",
}

local highlights_clear = {
    "SignColumn",
    "CursorLineNr",
    "StatusLine",
    "TabLineFill",
}

-- highlight
for group, args in pairs(highlights) do
    local command = string.format("highlight %s ", group)
    for arg, value in pairs(args) do
        command = command .. arg .. "=" .. value .. " "
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
