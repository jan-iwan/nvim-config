local tex = require("snippets.utils.tex")

return {
    -- square root
    s(
        { trig = "sr", snippetType = "autosnippet" },
        fmta([[\sqrt{<>}]], i(1)),
        { condition = tex.in_math, }
    ),

    -- square
    s(
        { trig = ".sq", snippetType = "autosnippet", wordTrig = false },
        t([[^2]]),
        { condition = tex.in_math, }
    ),

    s(
        { trig = "ee", snippetType = "autosnippet" },
        fmta([[e^{<>}]], i(1)),
        { condition = tex.in_math, }
    ),

    -- dot product
    s(
        { trig = ".d", snippetType = "autosnippet", wordTrig = false },
        t([[\cdot ]]),
        { condition = tex.in_math, }
    ),

    -- cross product / cartesian product
    s(
        { trig = ".x", snippetType = "autosnippet", wordTrig = false },
        t([[\times ]]),
        { condition = tex.in_math, }
    ),

    -- differential
    s(
        { trig = "df", snippetType = "autosnippet" },
        { t([[\dif ]]) },
        { condition = tex.in_math, }
    ),

    -- derivative
    s(
        { trig = ".dv", snippetType = "autosnippet", },
        c(1, {
            fmta([[\dv{<>}{<>}]], { rep(1, "fun"), rep(2, "var", i(nil, "x")) }),
            fmta([[\dv{<>} <>]], { rep(1, "var", i(nil, "x")), rep(2, "fun") }),
        })
    ),
    -- nth derivative
    s(
        { trig = ".ndv", snippetType = "autosnippet", },
        c(1, {
            fmta([[\dv[<>]{<>}{<>}]], { rep(1, "order", i(nil, "2")), rep(2, "fun"), rep(3, "var", i(nil, "x")) }),
            fmta([[\dv[<>]{<>} <>]], { rep(1, "order", i(nil, "2")), rep(2, "var", i(nil, "x")), rep(3, "fun") }),
        })
    ),

    -- partial derivative
    s(
        { trig = ".dp", snippetType = "autosnippet", },
        c(1, {
            fmta([[\pdv{<>}{<>}]], { rep(1, "fun"), rep(2, "var", i(nil, "x")) }),
            fmta([[\pdv{<>} <>]], { rep(1, "var", i(nil, "x")), rep(2, "fun") }),
        }),
        { condition = tex.in_math, }
    ),
    -- nth derivative
    s(
        { trig = ".ndp", snippetType = "autosnippet", },
        c(1, {
            fmta([[\pdv[<>]{<>}{<>}]], { rep(1, "order", i(nil, "2")), rep(2, "fun"), rep(3, "var", i(nil, "x")) }),
            fmta([[\pdv[<>]{<>} <>]], { rep(1, "order", i(nil, "2")), rep(2, "var", i(nil, "x")), rep(3, "fun") }),
        })
    ),

    -- partial derivative with subscript
    s(
        { trig = ".ds", snippetType = "autosnippet", },
        c(1, {
            fmta([[\partial_{<>} ]], { rep(1, "var", i(nil, "x")) }),
            fmta([[\partial^{<>}_{<>} ]], { i(1, "2"), rep(2, "var", i(nil, "x")) }),
        }),
        { condition = tex.in_math, }
    ),

    -- dot derivative
    s(
        { trig = ".d", snippetType = "autosnippet", },
        t([[\dot]])
    ),

    -- nabla
    s(
        { trig = "/n", snippetType = "autosnippet", },
        { t([[\nabla ]]) },
        { condition = tex.in_math, }
    ),

    -- limits
    s(
        { trig = "lim", snippetType = "autosnippet", },
        fmta([[\lim_{<>\to <>} <>]], { i(1), i(2), i(3) }),
        { condition = tex.in_math, }
    ),

    -- integral
    s(
        { trig = "int", snippetType = "autosnippet", },
        {
            c(1, {
                fmta([[\int <>]], { rep(1, "integrand") }),
                fmta([[\int_{<>}^{<>} <>]], { i(1, "a"), i(2, "b"), rep(3, "integrand") }),
            })
        },
        { condition = tex.in_math, }
    ),

    -- multiple integral
    s(
        { trig = "nint", snippetType = "autosnippet", },
        {
            c(1, {
                fmta([[\int_{<>} <>]], { rep(1, "domain"), rep(2, "integrand") }),
                fmta([[\iint_{<>} <>]], { rep(1, "domain"), rep(2, "integrand") }),
                fmta([[\iiint_{<>} <>]], { rep(1, "domain"), rep(2, "integrand") }),
            })
        },
        { condition = tex.in_math, }
    ),

    -- closed integral
    s(
        { trig = "oint", snippetType = "autosnippet", },
        {
            c(1, {
                fmta([[\oint_{<>} <>]], { rep(1, "domain"), rep(2, "integrand") }),
                fmta([[\oiint_{<>} <>]], { rep(1, "domain"), rep(2, "integrand") }),
                fmta([[\oiiint_{<>} <>]], { rep(1, "domain"), rep(2, "integrand") }),
            })
        },
        { condition = tex.in_math, }
    ),

    -- summation
    s(
        { trig = "sum", snippetType = "autosnippet", },
        {
            c(1, {
                fmta([[\sum_{<>}^{<>} <>]], { rep(1, "bound"), i(2, "\\infty"), rep(3, "sum") }),
                fmta([[\sum_{<>} <>]], { rep(1, "bound"), rep(2, "sum") }),
                fmta([[\sum <>]], { rep(1, "sum") }),
            }),
        },
        { condition = tex.in_math, }
    ),

    -- complex conjugate
    s(
        { trig = ".cj", snippetType = "autosnippet", },
        t([[\conj]]),
        { condition = tex.in_math, }
    ),

    -- subset
    s(
        { trig = "sst", snippetType = "autosnippet", wordTrig = false },
        t([[\subset]]),
        { condition = tex.in_mathzone, }
    ),
}
