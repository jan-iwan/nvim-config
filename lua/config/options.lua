vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 1
vim.opt.smartindent = true
-- spaces instead of tabs
vim.opt.expandtab = true

-- don't highlight all matches
vim.opt.hlsearch = false
-- default case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- highlight current line
vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true
-- always show signcolumn
vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- don't wrap lines (this is overriden for some filetypes)
vim.opt.wrap = false

-- max number of elements to show in popup menu
vim.opt.pumheight = 24

vim.opt.updatetime = 476

vim.opt.splitbelow = true

vim.opt.textwidth = 80

vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+,.*\.aux,.*\.log,.*\.fls,.*\.toc,.*\.fdb_latexmk,.*\.synctex.gz]]

vim.g.c_syntax_for_h = 1
