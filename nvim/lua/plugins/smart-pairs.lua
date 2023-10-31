-- https://github.com/ZhiyuanLck/smart-pairs
return {
    "ZhiyuanLck/smart-pairs",

    event = "InsertEnter",
    config = function()
        require("pairs"):setup({
            pairs = {
                ['*'] = {
                    { '(', ')' },
                    { '[', ']' },
                    { '{', '}' },
                    { "'", "'" },
                    { '"', '"' },
                },
                markdown = {
                    { '*', '*' },
                    { '`', '`', { triplet = true } },
                },
            },

            --[[
                Scenes like this:
                    {
                        str = "Hello World"
                        |
                    }
                Default press <bs>:
                    {
                        str = "Hello World"|
                    }
                Add 'delete.empty_line.text_bracket.one.strategy = "leave_one_start"' fix into:
                    {
                        str = "Hello World"
                    |
                    }
            ]]
            delete = {
                empty_line = {
                    bracket_text = { one = { strategy = "leave_one_start", } },
                    text_bracket = { one = { strategy = "leave_one_start", } },
                }
            },
            enter = {
                enable_mapping  = true,
                enable_cond     = false,
                enable_fallback = function()
                    -- https://github.com/gaoDean/autolist.nvim/issues/77
                    vim.loop.new_timer():start(0, 0, vim.schedule_wrap(function()
                        require("autolist").new_bullet()
                    end))

                    require('pairs.utils').feedkeys('<cr>')
                end,
            },
        })
    end
}
