vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		require("nvim-autopairs").setup({})
	end,
	once = true,
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
