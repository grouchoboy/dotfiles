require('plugins')

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.errorbells = true


vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true


-- Give more space for displaying messages
vim.opt.cmdheight = 1

vim.g.mapleader = " "


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.nord_italic = false
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.o.showtabline = 2
vim.cmd[[colorscheme nord]]
