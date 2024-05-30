-- -- ~~ -- -- ~~ -- ~~ ~~ # neovim config # ~~ ~~ -- ~~ -- -- ~~ -- --
--                                                                   --
-- Welcome to my nvim config!                                        --
-- I hope to have made it as readable as possible possible.          --
--                                                                   --
-- Files required in here are self explanatory. They are all in      --
-- lua/config. config.plugins specifies configuration for the plugin --
-- manager, lazy.nvim, but doesn't load any particular plugin.       --
--                                                                   --
-- 'lua/plugins' is sourced by lazy.nvim and contains configuration  --
-- for plugins in particular. Plugin-related keymaps are also there. --
-- There is also 'lua/data', which stores some data separately from  --
-- the configuration.                                                --
--                                                                   --
-- 'lua/snippets' is sourced by the LuaSnip plugin and contains      --
-- snippets written in lua. More info in 'lua/plugins/cmp.lua'.      --
--                                                                   --
-- 'after/ftplugin' contains filetype-specific configuration. They   --
-- are just autocommands but it's cleaner to have them there.        --
--                                                                   --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.plugins")
