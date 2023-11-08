return {
    -- https://github.com/hrsh7th/nvim-cmp
    "hrsh7th/cmp-cmdline",

    event = "VeryLazy",
    dependencies = "hrsh7th/nvim-cmp",

    config = function()
        local cmp = require("cmp")
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = 'path' } },
                { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
            )
        })
    end
}
