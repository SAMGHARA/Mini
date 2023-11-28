return {
    -- https://github.com/iamcco/markdown-preview.nvim
    "iamcco/markdown-preview.nvim",

    ft   = "markdown",
    cmd  = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    init = function()
        local core = require("core")
        core.setOptions { g = {
            -- specify browser to open preview page
            mkdp_browser = core.is_wsl() and "MicrosoftEdge.exe" or "firefox",
            -- auto close current preview window when changing from Markdown buffer to another buffer
            mkdp_auto_close = 1,
            -- echo preview page URL in command line when opening preview page
            mkdp_echo_preview_url = 1,
        } }
        core.setFileTypeCallBack("markdown", function()
            core.setKeyMaps {
                { "n", "<leader>mp", "<Cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" } }
            }
        end)
    end
}
