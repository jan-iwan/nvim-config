-- This was done with a lot of help from lsp-zero's migrate away guide:
-- https://github.com/VonHeikemen/lsp-zero.nvim/

local lsp_config = {
    "neovim/nvim-lspconfig",

    cmd = { "LspInfo" },

    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
        { "hrsh7th/nvim-cmp" },
        { "williamboman/mason.nvim" },
    },

    config = function()
        vim.diagnostic.config({ virtual_text = false })

        -- Diagnostics are not exclusive to lsp servers
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
        vim.keymap.set("n", "[l", vim.diagnostic.goto_next)
        vim.keymap.set("n", "]l", vim.diagnostic.goto_prev)

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            desc = "LSP actions",
            callback = function(event)
                -- Buffer-local keymaps
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
                vim.keymap.set({ "n", "x" }, "<F3>", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end
        })
    end
}

local mason = {
    "williamboman/mason.nvim",

    cmd = { "Mason" },
    keys = { { "<leader>lm", vim.cmd.Mason }, desc = "Mason" },

    dependencies = {
        { "neovim/nvim-lspconfig" },
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {},
        },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },

    build = function()
        pcall(vim.cmd, "MasonUpdate")
    end,

    opts = {
        ui = {
            icons = {
                package_installed = "ok",
                package_pending = "...",
                package_uninstalled = "x",
            },
        },
        keymaps = {
            cancel_installation = "x",
        },
    },

    config = function()
        local lsp = require("lspconfig")

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local default_setup = function(server)
            lsp[server].setup({
                capabilities = capabilities,
            })
        end

        require("mason").setup({})

        require("mason-lspconfig").setup({
            -- For clangd, i have $HOME/.clang-format for customizing the formatter
            -- For Python, i used pyright but it didn't work correctly for some reason. Also it was pretty slow
            ensure_installed = { "clangd", "lua_ls" },
            handlers = {
                default_setup,

                -- Specific configuration for lua_ls
                lua_ls = function()
                    lsp.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = { diagnostics = { globals = { "vim" } }, },
                        },
                    })
                end,
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                -- "black",   -- formatter, not needed with pylsp
                "debugpy", -- for nvim-dap-python
            }
        })
    end
}

local lang_specific = {
    -- Python
    {
        "psf/black",

        ft = "python",
    },
}

return { lsp_config, mason, lang_specific }
