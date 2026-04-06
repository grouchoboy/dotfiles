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
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/tpope/vim-sleuth" },

	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

require("custom.colors")()
require("custom.snacks")()
require("mason").setup({})
require("custom.conform")()
require("fidget").setup({})
require("custom.lspconfig")()
require("custom.blink")()
require("custom.treesitter")()

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

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("which-key").setup({
			delay = 0,
			spec = {
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			},
		})
	end,
	once = true,
})
