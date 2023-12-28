local ls  = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s   = ls.snippet
local t   = ls.text_node
local i   = ls.insert_node
local c   = ls.choice_node
local sn  = ls.snippet_node

ls.add_snippets("cpp", {
    s("cout", fmt(
        [[std::cout << {start} << std::endl;]], { start = i(0, [["Hello World"]]) }
    )),
    s("main", fmt(
        [[
            int main(int argc, char *argv[]) {{
                {start}
                return 0;
            }}
        ]], { start = i(0) }
    )),
    s("ifndef", fmt(
        [[
            #ifndef {def}
            #define {def}

            {start}

            #endif // {def}
        ]], { def = i(1, "__XXX_H__"), start = i(0) }, { repeat_duplicates = true }
    )),
    s("for", fmt(
        [[
            for ({}) {{
                {start}
            }}
        ]], { i(1), start = i(0) }
    )),
})
