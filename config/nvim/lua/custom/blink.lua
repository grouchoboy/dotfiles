return function()
	require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })
	require("blink.cmp").setup({
		keymap = {
			preset = "default",
			["<C-y>"] = { "select_and_accept" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = false,
			},
			ghost_text = { enabled = false },
		},
		sources = {
			default = { "snippets", "lsp", "path", "buffer" },
			-- default = { "lsp", "path", "buffer" },
			providers = {
				lsp = {
					async = true,
				},
			},
		},
		-- snippets = { preset = "luasnip" },
		fuzzy = { implementation = "lua" },
		signature = { enabled = false },
	})
end
