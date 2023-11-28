local Core = {}

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

Core.setFileTypeCallBack = function(ft, callback)
    vim.api.nvim_create_autocmd("FileType", { pattern = ft, callback = callback })
end

Core.setCommand = function(name, command, opts)
    vim.api.nvim_create_user_command(name, command, opts)
end

Core.setHighlights = function(highlights)
    for group, args in pairs(highlights) do
        local command = string.format("highlight %s ", group)
        for arg, value in pairs(args) do
            command = command .. arg .. "=" .. value .. " "
        end
        vim.api.nvim_command(command)
    end
end

Core.linkHighlights = function(highlights)
    for group, link in pairs(highlights) do
        local command = string.format("highlight link %s %s", group, link)
        vim.api.nvim_command(command)
    end
end

Core.clearHighlights = function(highlights)
    for _, group in pairs(highlights) do
        vim.api.nvim_command("highlight clear " .. group)
    end
end

Core.is_wsl = function()
    if vim.fn.has("unix") then
        local version = vim.fn.readfile("/proc/version")
        for _, v in ipairs(version) do
            if vim.fn.match(v, "WSL") >= 0 then
                return true
            end
        end
    end
    return false
end

return Core
