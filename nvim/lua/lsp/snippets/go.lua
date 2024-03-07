local ls  = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s   = ls.snippet
local t   = ls.text_node
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
    s("init", fmt(
        [[
            func init() {{
                {}
            }}
        ]], i(0)
    )),
    s("ife", fmt(
        [[
           if err != nil {{
               {}
           }}
       ]], i(0)
    )),
    s("fpf", fmt([[fmt.Printf({})]], i(0))),
    s("fpl", fmt([[fmt.Println({})]], i(0))),
    s("json", fmt([[`json:"{}"`]], i(0))),
    s("db", fmt([[`db:"{}"`]], i(0))),
    s("date", t([["2006-01-02 15:04:05"]])),
})
