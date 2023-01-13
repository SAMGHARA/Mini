local M = {
    { "hrsh7th/cmp-buffer",  after = "nvim-cmp" },
    { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
    {
        -- https://github.com/hrsh7th/nvim-cmp
        "hrsh7th/nvim-cmp",

        config = function()
            local status, cmp = pcall(require, "cmp")
            if not status then
                return
            end

            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = 'buffer' } }
            })
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources(
                    { { name = 'path' } },
                    { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
                )
            })
        end
    }
}

return M
