local ls  = require("luasnip")
local e   = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local s   = ls.snippet
local i   = ls.insert_node
local t   = ls.text_node

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

-- Golang
ls.add_snippets("go", {
    s("main", fmt(
        [[
            package main

            func main() {{
                {}
            }}
        ]], i(0)
    )),
    s("func", fmt(
        [[
            func {}({}) ({}) {{
                {}
            }}
        ]], { i(1, "func"), i(2, "params"), i(3, "rets"), i(0) }
    )),
    s("ife", fmt(
        [[
           if err != nil {{
               {}
           }}
       ]], i(0)
    )),
    s("db", fmt(
        [[`db:"{}"`]], i(0)
    )),
    s("json", fmt(
        [[`json:"{}"`]], i(0)
    )),
    s("date", t([["2006-01-02 15:04:05"]])),
})

ls.add_snippets("cpp", {
    s("cout", fmt(
        [[std::cout << {} << std::endl;]], { i(0, [["Hello World"]]) }
    )),
    s("main", fmt(
        [[
            int main(int argc, char *argv[]) {{
                {}
                return 0;
            }}
        ]], { i(0) }
    )),
    s("ifndef", fmt(
        [[
            #ifndef {def}
            #define {def}

            {}

            #endif // {def}
        ]], { def = i(1, "__XXX_H__"), i(0) }, { repeat_duplicates = true }
    )),
    s("for", fmt(
        [[
            for ({}) {{
                {}
            }}
        ]], { i(1), i(0) }
    )),
})

ls.add_snippets("rust", {
    s("main", fmt(
        [[
            fn main() {{
                {}
            }}
        ]], i(0)
    )),
    s("println", fmt([[println!("{}");]], i(0))),
})
