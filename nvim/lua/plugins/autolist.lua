local M = {
    -- https://github.com/gaoDean/autolist.nvim
    "gaoDean/autolist.nvim",

    after = "smart-pairs"
}

M.setup = function()

end

M.config = function()
    local status, autolist = pcall(require, "autolist")
    if not status then
        return
    end

    autolist.setup {
        enabled = true,
        list_cap = 50,
        colon = {
            indent_raw = true,
            indent = true,
            preferred = "-",
        },
        invert = {
            indent = false,
            toggles_checkbox = true,
            ul_marker = "-",
            ol_incrementable = "1",
            ol_delim = ".",
        },
        lists = {
            markdown = {
                "unordered",
                "digit",
                "ascii",
                "roman",
            },
            text = {
                "unordered",
                "digit",
                "ascii",
                "roman",
            },
            tex = { "latex_item" },
            plaintex = { "latex_item" },
        },
        list_patterns = {
            unordered = "[-+*]", -- - + *
            digit = "%d+[.)]", -- 1. 2. 3.
            ascii = "%a[.)]", -- a) b) c)
            roman = "%u*[.)]", -- I. II. III.
            latex_item = "\\item",
        },
        checkbox = {
            left = "%[",
            right = "%]",
            fill = "x",
        },
    }

    -- TODO: error with nvim-autopairs/smart-pairs
    -- autolist.create_mapping_hook("i", "<CR>", autolist.new)
    autolist.create_mapping_hook("n",  "o",   autolist.new)
    autolist.create_mapping_hook("n",  "O",   autolist.new_before)
end

return M
