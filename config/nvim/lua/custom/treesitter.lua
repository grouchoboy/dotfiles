return function()
	local filetypes = { "lua", "go", "bash" }
	require("nvim-treesitter").install(filetypes)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		callback = function()
			vim.treesitter.start()
		end,
	})
end
