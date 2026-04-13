-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

vim.opt.number = true
vim.opt.relativenumber = false

-- when inserting bracket, briefly jump to the matching one (https://neovim.io/doc/user/options/#'showmatch')
-- vim.opt.showmatch = true

-- sync clipboard between OS and neovim
vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true

-- enable mouse
vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 400
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = false

vim.opt.cursorline = true

vim.opt.scrolloff = 5

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
