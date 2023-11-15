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

Core.addFileTypes = vim.filetype.add

Core.setCommand = function(name, command, opts)
    vim.api.nvim_create_user_command(name, command, opts)
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
