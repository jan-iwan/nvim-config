return {
    s(
        { trig = "ifndef" },
        fmt([[
        #ifndef {}
        #define {}

        {}

        #endif /* {} */
        ]], { i(1), rep(1), i(0), rep(1) })
    )
}
