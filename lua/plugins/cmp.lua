-- text instead of icons in completion menu
local kind_icons = {
    Text = "txt",
    Method = ".m()",
    Function = "f()",
    Constructor = "F()",
    Field = ".x",
    Variable = "var",
    Class = "class",
    Interface = "intf",
    Module = "lib",
    Property = "prop",
    Unit = "unit",
    Value = "val",
    Enum = "enum",
    Keyword = "key",
    Snippet = "snip",
    Color = "color",
    File = "file",
    Reference = "ref",
    Folder = "file/",
    EnumMember = "enum",
    Constant = "const",
    Struct = "struct",
    Event = "event",
    Operator = "++",
    TypeParameter = "()",
}

local cmp = {
    "hrsh7th/nvim-cmp",

    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip" },
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- cmp is enabled by default
        local enable = true
        -- but it can be disabled (toggled) by with this keymap if you wanted to
        vim.keymap.set("n", "<leader>C",
            function()
                enable = not enable
                cmp.setup({ enabled = enable })
            end)

        cmp.setup({
            mapping = {
                ["<C-k>"] = cmp.mapping(function(fallback)
                    if luasnip.expandable() then
                        luasnip.expand()
                    elseif cmp.visible() then
                        cmp.confirm()
                    else
                        fallback()
                    end
                end),

                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),

                ["<C-b>"] = cmp.mapping.abort(),

                -- navigate documentation
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),

                -- trigger completion menu
                ["<C-Space>"] = cmp.mapping.complete(),

                -- LuaSnip-related mappings
                -- jump to next placeholder
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- jump to previous placeholder
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- cycle through choices in luasnip (i love this)
                ["<C-c>"] = cmp.mapping(function(fallback)
                    if luasnip.choice_active() then
                        luasnip.change_choice(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            window = {
                -- limit docs size
                documentation = { max_height = 32, max_width = 32, },
            },
            snippet = {
                expand = function(args)
                    -- LuaSnip specific
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "luasnip",    keyword_length = 2 },
                { name = "nvim_lsp" },
                { name = "cmp-vimtex", keyword_length = 2 },
                { name = "buffer",     keyword_length = 4 },
                { name = "path" },
                { name = "nvim_lua" }, -- lua for nvim
            },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, item)
                    -- kind icons
                    item.kind = kind_icons[item.kind]

                    -- limit cmp window width
                    local content = item.abbr
                    local W_MAX = 20
                    if #content > W_MAX then
                        item.abbr = vim.fn.strcharpart(content, 0, W_MAX) .. "..."
                    else
                        item.abbr = content .. (" "):rep(W_MAX - #content)
                    end

                    local short_name = {
                        nvim_lsp = "lsp",
                        luasnip  = "snip",
                        vimtex   = "tex",
                        buffer   = "buf",
                        path     = "path",
                        nvim_lua = "vim",
                    }

                    local menu_name = short_name[entry.source.name] or entry.source.name
                    item.menu = string.format("[%s]", menu_name)

                    return item
                end,
            },
            -- preselect first item
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
        })
    end
}

local snippets = {
    -- I use LuaSnip as my snippet engine. It allows for powerful custom snippets
    -- written in lua.
    -- I did this with a lot of help from TJ DeVries videos about this plugin:
    -- https://youtu.be/Dn800rlPIho?si=8rtkypNCys1EbSi8

    -- files inside of 'lua/snippets' are organized per filetype and written
    -- using LuaSnip functions. I've tried to not abstract it too much so that
    -- it is direct and understandable once you've learnt the plugin.

    -- It's very much work in progress though. There are only snippets for
    -- LaTeX and markdown so far.

    "L3MON4D3/LuaSnip",

    event = { "InsertEnter", "CmdlineEnter" },

    -- i don't really like these
    -- dependencies = {{ "rafamadriz/friendly-snippets" }},

    build = "make install_jsregexp",

    version = "v2.*",

    config = function()
        -- for friendly-snippets (VS Code-like)
        -- require("luasnip.loaders.from_vscode").lazy_load({
        --     exclude = "latex",
        -- })

        -- load custom lua snippets
        require("luasnip.loaders.from_lua").lazy_load({
            paths = "~/.config/nvim/lua/snippets"
        })

        local luasnip = require("luasnip")

        luasnip.config.set_config({
            -- remember to keep around the last snippet
            history = true,

            -- autoexpand some snippets
            enable_autosnippets = true,

            -- dynamic snippets that update while typing
            updateevents = "TextChanged,TextChangedI",

            -- this is for pasting selected text inside of a snippet
            store_selection_keys = "<C-s>",
        })
    end
}

local cmp_vimtex = {
    "micangl/cmp-vimtex",

    dependencies = {
        "hrsh7th/nvim-cmp",
    }
}

return { cmp, snippets, cmp_vimtex }
