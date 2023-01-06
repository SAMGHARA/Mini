local M = {
    {
        -- https://github.com/nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",

        run = ":TSUpdate",
        cmd = {
            "TSInstall",
            "TSBufEnable",
            "TSBufDisable",
            "TSEnable",
            "TSDisable",
            "TSModuleInfo",
        },
    },

    {
        -- https://github.com/nvim-treesitter/playground
        "nvim-treesitter/playground",

        cmd = "TSHighlightCapturesUnderCursor"
    }
}

M[1].setup = function()
    vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" },
        {
            callback = function()
                local file = vim.fn.expand "%"
                if file ~= "NvimTree_1" and file ~= "[packer]" and file ~= "" then
                    require("packer").loader("nvim-treesitter")
                end
            end
        })

    local keymaps = {
        { "n", "H", "<cmd>TSHighlightCapturesUnderCursor<cr>" }
    }
    require("core").setKeyMaps(keymaps)
end

M[1].config = function()
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
        return
    end

    for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
        config.install_info.url = config.install_info.url:gsub("https://github.com/",
            "https://ghproxy.com/https://github.com/")
    end

    treesitter.setup {
        ensure_installed = { "c", "cpp", "go", "lua", "markdown" },
        -- sync_install = true,

        -- Automatically install missing parsers when entering buffer
        -- auto_install = true,

        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            -- additional_vim_regex_highlighting = false,
        }
    }
end

return M
