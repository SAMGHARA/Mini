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
                    bracket_text = {
                        one = { strategy = "leave_one_start", }
                    },
                    text_bracket = {
                        one = { strategy = "leave_one_start", }
                    },
                }
            }
        })
    end
}
