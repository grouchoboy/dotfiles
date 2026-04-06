vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.showmatch = true

-- sync clipboard between OS and neovim
vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true

-- enable mouse
vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "no"

vim.opt.updatetime = 400
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = false

vim.opt.cursorline = true

vim.opt.scrolloff = 5

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("colors")()
require("plugin-snacks")()
require("mason").setup({})
require("plugin-conform")()

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		-- 1. Ensure both are loaded (packadd is idempotent, so it won't hurt to call twice)
		-- vim.cmd('packadd nvim-cmp')
		vim.cmd("packadd nvim-autopairs")

		-- 2. Run your config logic
		require("nvim-autopairs").setup({})
	end,
	once = true, -- Crucial: only run this the FIRST time you enter insert mode
})

-- treesitter
treesitter = function()
	local filetypes = { "lua", "go", "bash" }
	require("nvim-treesitter").install(filetypes)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		callback = function()
			vim.treesitter.start()
		end,
	})
end
treesitter()
-- end treesitter
