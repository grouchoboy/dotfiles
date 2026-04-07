require("custom.options")
require("vim._core.ui2").enable()
require("custom.colors")()
require("custom.snacks")()
require("mason").setup({})
require("custom.conform")()
require("custom.lspconfig")()
require("custom.blink")()
require("custom.treesitter")()
require("lualine").setup({})
require("custom.autocmd")
require("fidget").setup({
	notification = {
		override_vim_notify = true,
	},
})

vim.keymap.set("n", "<leader>qe", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>qq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>qo", require("undotree").open, { desc = "Open undotree" })
