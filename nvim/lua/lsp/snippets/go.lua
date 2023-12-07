local ls  = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s   = ls.snippet
local i   = ls.insert_node

-- Golang
ls.add_snippets("go", {
    s("main", fmt(
        [[
            package main

            func main() {{
                {start}
            }}
        ]], { start = i(0) }
    )),
    s("func", fmt(
        [[
            func {}({}) ({}) {{
                {start}
            }}
        ]], { i(1, "func"), i(2, "params"), i(3, "rets"), start = i(0) }
    )),
})
