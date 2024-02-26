local utils = require("snippets.utils")
local tex = require("snippets.utils.tex")

local brackets = {
	p = { "(", ")" },
    v = { "\\lVert", "\\rVert" },
	a = { "\\langle", "\\rangle" },
	A = { "Angle", "Angle" },
	b = { "brack", "brack" },
	B = { "Brack", "Brack" },
	c = { "brace", "brace" },
	m = { "|", "|" },
}

return {
    -- inline math
    s(
        { trig = "mm", snippetType = "autosnippet", },
        fmta("$<>$ <>", { i(1), i(0) })
    ),

    -- fraction
    s(
        { trig = "//", snippetType = "autosnippet", },
        fmta([[\\frac{<>}{<>}]], { i(1), i(2) }),
        { condition = tex.in_mathzone, }
    ),

    -- subscript
    s(
        { trig = "__", wordTrig = false, snippetType = "autosnippet", },
        fmta("_{<>}", { i(1) }),
        { condition = tex.in_mathzone, }
    ),

    -- superscript
    s(
        { trig = "^^", wordTrig = false, snippetType = "autosnippet", },
        fmta("^{<>}", { i(1) }),
        { condition = tex.in_mathzone, }
    ),

    -- infinity
    s(
        { trig = "fi", snippetType = "autosnippet", },
        t([[\infty]]),
        { condition = tex.in_mathzone, }
    ),

    -- function definition
    s(
        { trig = "fun", snippetType = "autosnippet", },
        fmta([[<>:<>\to <>]], { i(1, "f"), i(2, "\\reals"), i(3, "\\reals")} ),
        { condition = tex.in_mathzone, }
    ),

    -- delimiters. e.g. \left( \right)
    s(
        { trig = "lr([aAbBcmp])", regTrig = true, snippetType = "autosnippet" },
        fmta([[
        \left<> <> \right<>
        ]],{
            f(function(_, snip)
                local cap = snip.captures[1] or "p"
                return brackets[cap][1]
            end),
            d(1, utils.get_selection),
            f(function(_, snip)
                local cap = snip.captures[1] or "p"
                return brackets[cap][2]
            end),
        }),
        { condition = tex.in_mathzone, }
    ),
}
