local Core = {}

Core.colors = {
    red        = "#E06C75",
    red_dark   = "#BD3D37",
    orange     = "#D19A66",
    yellow     = "#E5C07B",
    green      = "#98C379",
    green_dark = "#109868",
    cyan       = "#56B6C2",
    blue       = "#61AFEF",
    purple     = "#C678DD",
    black      = "#3e4452",
    black_dark = "#2c313c",
    white      = "#ABB2BF",
    white_dark = "#FFFFFF",
    grey       = "#5C6370",
    grey_dark  = "#3B4048",
}

Core.setHighlight = function(Highlights)
    for group, args in pairs(Highlights) do
        local command = string.format("highlight %s ", group)
        for arg, value in pairs(args) do
            command = command .. arg .. "=" .. value .. " "
        end
        vim.api.nvim_command(command)
    end
end

Core.clearHighlight = function(Groups)
    for _, group in pairs(Groups) do
        vim.api.nvim_command("highlight clear " .. group)
    end
end

Core.linkHighlight = function(Links)
    for group, link in pairs(Links) do
        local command = string.format("highlight link %s %s", group, link)
        vim.api.nvim_command(command)
    end
end

Core.setOptions = function(options)
    for type, opts in pairs(options) do
        for k, v in pairs(opts) do
            vim[type][k] = v;
        end
    end
end

Core.setKeyMaps = function(keymaps)
    for _, maps in pairs(keymaps) do
        vim.keymap.set(maps[1], maps[2], maps[3], maps[4] and maps[4] or {})
    end
end

Core.addFileTypes = vim.filetype.add

Core.setCommand = function(name, command, opts)
    vim.api.nvim_create_user_command(name, command, opts)
end

return Core
