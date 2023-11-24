local opts = {
    line = {
        lua = "--",
        cpp = "//",
        go  = "//",
    },
    hunk = {
        lua = { "--[[", "]]" },
        cpp = { "/*", "*/" },
        go  = { "/*", "*/" },
    },
    space_padding = true,
}

local SpacePadding = function() return opts.space_padding and " " or "" end

local CommentChSize = function(ch)
    return type(ch) == "string" and #ch + (opts.space_padding and 1 or 0)
        or #ch[1] + (opts.space_padding and 2 or 1) + #ch[2]
end

local getCommentRange = function()
    local mode = vim.api.nvim_get_mode().mode
    if mode == "n" or mode == "i" then
        local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
        return {
            srow = row,
            erow = row,
        }
    else
        local spos, epos = vim.fn.getpos("v"), vim.fn.getpos(".")
        return {
            srow = math.min(spos[2], epos[2]),
            erow = math.max(spos[2], epos[2]),
        }
    end
end

local lineCommentCheck = function(ch, range)
    local commented = true
    range.scol = {}
    range.space_padding = {}
    range.lines = vim.api.nvim_buf_get_lines(0, range.srow - 1, range.erow, false)

    for i = 1, #range.lines do
        range.scol[i] = range.lines[i]:find("%S") or #range.lines[i] + 1
        if (range.lines[i]:sub(range.scol[i], range.scol[i] - 1 + #ch) == ch) then
            range.space_padding[i] = range.lines[i]:match(" ", range.scol[i] + 1) and 1 or 0
        else
            commented = false
        end
    end
    return commented
end

local hunkCommentCheck = function(ch, range)
    local commented = true
    range.lines = vim.api.nvim_buf_get_lines(0, range.srow - 1, range.erow, false)
    local sline, eline = range.lines[1], range.lines[#range.lines]

    range.scol = sline:find("%S") or #sline + 1
    if (sline:sub(range.scol, range.scol - 1 + #ch[1]) == ch[1] and eline:sub(#eline - #ch[2] + 1) == ch[2]) then
        range.space_padding = { sline:match(" ", range.scol + 1) and 1 or 0, eline:match(" ", #eline - #ch[2]) and 1 or 0 }
    else
        commented = false
    end
    return commented
end

--
--
local Comment = {
    CommentLine = function()
        local ft = vim.bo.filetype
        local ch = vim.deepcopy(opts.line[ft])
        if not ch then return print(string.format("None '%s' line-comment!", ft)) end

        local range = getCommentRange()
        local commented = lineCommentCheck(ch, range)

        if commented then -- uncomment
            for i = 1, #range.lines do
                range.lines[i] = range.lines[i]:sub(0, range.scol[i] - 1) ..
                    range.lines[i]:sub(range.scol[i] + #ch + range.space_padding[i])
            end
        else -- comment
            local mincol = math.min(unpack(range.scol))
            for i = 1, #range.lines do
                range.lines[i] = range.lines[i]:sub(0, mincol - 1) .. ch .. SpacePadding() .. range.lines[i]:sub(mincol)
            end
        end
        vim.api.nvim_buf_set_lines(0, range.srow - 1, range.erow, false, range.lines)

        if not commented and range.srow == range.erow and #range.lines[1] == range.scol[1] - 1 + CommentChSize(ch) then
            vim.api.nvim_win_set_cursor(0, { range.srow, #range.lines[1] })
            if vim.api.nvim_get_mode().mode == "n" then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("a", true, false, true), "n", false)
            end
        end
    end,
    CommentHunk = function()
        local ft = vim.bo.filetype
        local ch = vim.deepcopy(opts.hunk[ft])
        if not ch then return print(string.format("None '%s' hunk-comment!", ft)) end

        local range = getCommentRange()
        local commented = hunkCommentCheck(ch, range)

        if commented then -- uncomment
            local sline = range.lines[1]
            range.lines[1] = sline:sub(0, range.scol - 1) .. sline:sub(range.scol + #ch[1] + range.space_padding[1])

            local eline = range.lines[#range.lines]
            range.lines[#range.lines] = eline:sub(0, #eline - #ch[2] - range.space_padding[2])
        else -- comment
            local sline = range.lines[1]
            range.lines[1] = sline:sub(0, range.scol - 1) .. ch[1] .. SpacePadding() .. sline:sub(range.scol)

            local eline = range.lines[#range.lines]
            range.lines[#range.lines] = eline .. SpacePadding() .. ch[2]
        end
        vim.api.nvim_buf_set_lines(0, range.srow - 1, range.erow, false, range.lines)

        if not commented and range.srow == range.erow and (#range.lines[1] == range.scol - 1 + CommentChSize(ch)) then
            vim.api.nvim_win_set_cursor(0, { range.srow, #range.lines[1] - #ch[2] - (opts.space_padding and 1 or 0) })
            if vim.api.nvim_get_mode().mode == "n" then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true), "n", false)
            end
        end
    end
}

return Comment
