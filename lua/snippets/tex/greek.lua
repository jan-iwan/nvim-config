local tex = require("snippets.utils.tex")

local alphabet = {
    ["a"] = "alpha",
    ["b"] = "beta",
    ["g"] = "gamma",
    ["G"] = "Gamma",
    ["d"] = "delta",
    ["D"] = "Delta",
    ["e"] = "varepsilon",
    [";e"] = "epsilon",
    ["z"] = "zeta",
    ["h"] = "eta",
    ["t"] = "theta",
    ["T"] = "Theta",
    ["i"] = "iota",
    ["k"] = "kappa",
    ["l"] = "lambda",
    ["L"] = "Lambda",
    ["m"] = "mu",
    ["n"] = "nu",
    ["x"] = "xi",
    ["X"] = "Xi",
    ["pi"] = "pi",
    ["PI"] = "Pi",
    ["r"] = "rho",
    [";r"] = "varrho",
    ["s"] = "sigma",
    ["S"] = "Sigma",
    ["pt"] = "tau",
    ["u"] = "upsilon",
    ["U"] = "Upsilon",
    ["f"] = "phi",
    ["F"] = "Phi",
    [";f"] = "varphi",
    ["c"] = "chi",
    ["ps"] = "psi",
    ["PS"] = "Psi",
    ["o"] = "omega",
    ["O"] = "Omega",
}

local snips = {}
for trig, text in pairs(alphabet) do
    table.insert(snips, s(
    { trig = ";" .. trig, snippetType = "autosnippet", wordTrig = false },
    { t("\\" .. text), },
    { condition = tex.in_math }
    ))
end

return snips
