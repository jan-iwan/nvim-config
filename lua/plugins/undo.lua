-- undo tree
local undo = {
    "simnalamburt/vim-mundo",

    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.MundoToggle)
        vim.g.mundo_width = 30
        vim.g.mundo_preview_height = 10
        vim.g.mundo_preview_bottom = 1
        vim.g.mundo_playback_delay = 33
    end
}

return undo
