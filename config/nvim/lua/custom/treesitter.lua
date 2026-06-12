-- return function()
-- 	local filetypes = { "lua", "go", "bash" }
-- 	require("nvim-treesitter").install(filetypes)
-- 	vim.api.nvim_create_autocmd("FileType", {
-- 		pattern = filetypes,
-- 		callback = function()
-- 			vim.treesitter.start()
-- 		end,
-- 	})
-- end

return function()
	-- Automatically enable native Tree-sitter features for Go
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "*.go", "*.lua" },
		callback = function()
			-- Start native highlighting
			vim.treesitter.start()

			-- Optional: Enable native code folding using Tree-sitter
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	})
end
