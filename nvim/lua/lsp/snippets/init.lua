local ls  = require("luasnip")
local e   = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local s   = ls.snippet
local i   = ls.insert_node

-- all
ls.add_snippets("all", {
    s("date", { e.partial(os.date, "%Y-%m-%d %H:%M:%S") }),
})

-- shell
ls.add_snippets("sh", {
    s("sh", fmt(
        [[
            #!/bin/{}

            {}
        ]], { i(1, "bash"), i(0) }
    ))
})

-- markdown
ls.add_snippets("markdown", {
    s("code", fmt(
        [[
            ```{}
            {start}
            ```
        ]], { i(1, "code"), start = i(0) }
    )),
    s("title", fmt(
        [[
            ---
            title: {}
            date: {}
            description: {}

            categories:
                - {}

            image: {}
            ---
            {start}
        ]], { i(1, "title"), i(2, os.date("%Y-%m-%d")), i(3), i(4), i(5), start = i(0) }
    ))
})

require("lsp.snippets.c")
require("lsp.snippets.go")
