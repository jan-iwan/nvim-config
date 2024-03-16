local dap = {
    {
        "mfussenegger/nvim-dap",

        lazy = true,

        config = function()
            local dap = require("dap")

            -- Check `:help dap.txt` for descriptions and more functions
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dc", dap.continue)
            vim.keymap.set("n", "<leader>dv", dap.step_over)
            vim.keymap.set("n", "<leader>dn", dap.step_into)
            vim.keymap.set("n", "<leader>do", dap.step_out)
            vim.keymap.set("n", "<leader>dx", dap.terminate)
            vim.keymap.set("n", "<leader>dC", dap.clear_breakpoints)
            vim.keymap.set("n", "<leader>dk", require("dap.ui.widgets").hover)
        end
    },

    {
        "rcarriga/nvim-dap-ui",

        lazy = true,

        dependencies = {
            "mfussenegger/nvim-dap",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            vim.keymap.set("n", "<leader>di", dapui.toggle)

            -- This is MOSTLY the default configuration
            -- Check `:help dapui.setup()`
            dapui.setup({
                mappings = {
                    edit = "e",
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t"
                },
                controls = {
                    element = "repl",
                    enabled = true,
                    -- I dislike icons
                    icons = {
                        disconnect = "[discon]",
                        pause = "[pause]",
                        play = "[play]",
                        run_last = "[runlast]",
                        step_back = "[>back]",
                        step_into = "[>into]",
                        step_out = "[>out]",
                        step_over = "[>over]",
                        terminate = "[x]"
                    }
                },
                element_mappings = {},
                expand_lines = true,
                floating = {
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" }
                    }
                },
                force_buffers = true,
                icons = {
                    collapsed = ">",
                    current_frame = ">",
                    expanded = "v"
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes",      size = 0.25 },
                            { id = "stacks",      size = 0.25 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "watches",     size = 0.25 },
                        },
                        position = "left",
                        size = 40
                    },
                    {
                        elements = {
                            { id = "console", size = 0.5 },
                            { id = "repl",    size = 0.5 },
                        },
                        position = "bottom",
                        size = 17
                    }
                },
                render = {
                    indent = 2,
                    max_value_lines = 100
                }
            })

            -- Automatically open or close based on nvim-dap events
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end

            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    },
}

local languages = {
    -- Python
    {
        "mfussenegger/nvim-dap-python",

        ft = "python",

        dependencies = {
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-ui",
        },

        config = function()
            require("dap-python").setup("/usr/bin/python3")
        end
    }
}

return { dap, languages }
