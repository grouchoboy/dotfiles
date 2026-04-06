return function()
	require("snacks").setup({
		explorer = {
			auto_open = false,
			auto_close = false,
			replace_netrw = false,
		},
		picker = {
			sources = {
				explorer = {
					git_status = false,
					auto_open = false,
					follow_file = false,
					use_icons = false,
					icons = {
						files = {
							enabled = false,
						},
					},
				},
			},
		},
	})
	local map = vim.keymap.set

	map("n", "<leader>e", function()
		Snacks.explorer()
	end, { desc = "File Explorer" })
	map("n", "<leader><leader>", function()
		Snacks.picker.buffers()
	end, { desc = "Buffers" })
	map("n", "<leader>ss", function()
		Snacks.picker.smart()
	end, { desc = "Smart Find Files" })
	map("n", "<leader>sf", function()
		Snacks.picker.files()
	end, { desc = "Find Files" })
	map("n", "<leader>sg", function()
		Snacks.picker.grep()
	end, { desc = "Grep" })
	map("n", "<leader>/", function()
		Snacks.picker.lines()
	end, { desc = "Buffer Lines" })
	map("n", "<leader>sr", function()
		Snacks.picker.resume()
	end, { desc = "Resume" })
	map("n", "<leader>sR", function()
		Snacks.picker.recent()
	end, { desc = "Recent" })
	map("n", "<leader>sq", function()
		Snacks.picker.qflist()
	end, { desc = "Quickfix List" })
	map("n", "<leader>sj", function()
		Snacks.picker.jumps()
	end, { desc = "Jumps" })
	map("n", "<leader>sk", function()
		Snacks.picker.keymaps()
	end, { desc = "Keymaps" })
	map("n", "<leader>sd", function()
		Snacks.picker.diagnostics()
	end, { desc = "Diagnostics" })
	map("n", "<leader>sD", function()
		Snacks.picker.diagnostics_buffer()
	end, { desc = "Buffer Diagnostics" })
end
