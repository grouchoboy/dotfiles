return function()
	-- require("nvim-treesitter").setup({
	-- 	-- Ensure these specific parsers are installed
	-- 	ensure_installed = { "lua", "go", "bash", "sql" },
	--
	-- 	-- Automatically install missing parsers when entering a buffer
	-- 	auto_install = true,
	--
	-- 	-- THIS is the engine that handles highlighting AND injections
	-- 	highlight = {
	-- 		enable = true,
	-- 		-- Disables older regex-based highlighting so Treesitter can take over fully
	-- 		additional_vim_regex_highlighting = false,
	-- 	},
	-- })
	local filetypes = { "lua", "go", "bash", "sql" }
	require("nvim-treesitter").install(filetypes)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		callback = function()
			vim.treesitter.start()

			-- Optional: Enable native code folding using Tree-sitter
			-- vim.wo.foldmethod = "expr"
			-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	})
end

-- return function()
-- 	-- Automatically enable native Tree-sitter features for Go
-- 	vim.api.nvim_create_autocmd("FileType", {
-- 		pattern = { "*.go", "*.lua" },
-- 		callback = function()
-- 			-- Start native highlighting
-- 			vim.treesitter.start()
--
-- 			-- Optional: Enable native code folding using Tree-sitter
-- 			vim.wo.foldmethod = "expr"
-- 			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 		end,
-- 	})
-- end
