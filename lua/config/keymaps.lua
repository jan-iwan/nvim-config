vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ## normal mode ## --

-- easier write and quit
vim.keymap.set("n", ";w", ":w<cr>")

-- netrw file explorer
vim.keymap.set("n", "<leader>e", ":Explore<CR>")

-- window navigation (normal and terminal mode)
vim.keymap.set({ "n", "t" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "t" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "t" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n", "t" }, "<C-l>", "<C-w>l")

-- window size
vim.keymap.set({ "n", "t" }, "<C-A-h>", ":vertical resize -2<CR>")
vim.keymap.set({ "n", "t" }, "<C-A-j>", ":resize +2<CR>")
vim.keymap.set({ "n", "t" }, "<C-A-k>", ":resize -2<CR>")
vim.keymap.set({ "n", "t" }, "<C-A-l>", ":vertical resize +2<CR>")

-- buffers
vim.keymap.set("n", "<leader>q", vim.cmd.bdelete)
vim.keymap.set("n", "<S-l>", vim.cmd.bnext)
vim.keymap.set("n", "<S-h>", vim.cmd.bprevious)

-- move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==")

-- ## visual mode ## --

-- for indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move text up and down
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")

-- paste from the 0 register, which contains the pasted text but not the one
-- replaced. The replaced text is yanked normally tho.
-- I used '<leader>p' instead of just 'p' to be able to still use other
-- registers without conflicts.
vim.keymap.set({ "n", "v" }, "<leader>p", '"0p')


-- ## visual block mode ## --

-- move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")
