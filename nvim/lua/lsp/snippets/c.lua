local ls  = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s   = ls.snippet
local i   = ls.insert_node

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
            for (int {num} = {}; {num} {}; {num}{}) {{
                {start}
            }}
        ]], { num = i(1, "i"), i(2, "0"), i(3, "< 10"), i(4, "++"), start = i(0) }, { repeat_duplicates = true }
    )),
    s("for", fmt(
        [[
            for ({} auto {} : {}) {{
                {start}
            }}
        ]], { i(1, "const"), i(2, "&i"), i(3, "args"), start = i(0) }
    ))
})
