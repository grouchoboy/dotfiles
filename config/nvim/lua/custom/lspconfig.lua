return function()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
		callback = function(event)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			map("gd", require("snacks").picker.lsp_definitions, "[g]o to [d]efinition")
			map("<leader>ds", require("snacks").picker.lsp_symbols, "[d]document [s]ymbols")
			map("<leader>ws", require("snacks").picker.lsp_workspace_symbols, "[w]orkspace [w]ymbols")
			map("gR", require("snacks").picker.lsp_references, "[g]oto [r]eferences")
			map("gI", require("snacks").picker.lsp_implementations, "[G]oto [I]mplementation")
			map("<leader>D", require("snacks").picker.lsp_type_definitions, "Type [D]efinition")
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			map("K", vim.lsp.buf.hover, "Hover Documentation")
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

			-- The following two autocommands are used to highlight references of the
			-- word under your cursor when your cursor rests there for a little while.
			--    See `:help CursorHold` for information about when this is executed
			--
			-- When you move your cursor, the highlights will be cleared (the second autocommand).
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client.server_capabilities.documentHighlightProvider then
				local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})
			end

			-- The following autocommand is used to enable inlay hints in your
			-- code, if the language server you are using supports them
			--
			-- This may be unwanted, since they displace some of your code
			if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
				map("<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, "[T]oggle Inlay [H]ints")
			end
		end,
	})

	vim.api.nvim_create_autocmd("LspDetach", {
		group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
		callback = function(event)
			vim.lsp.buf.clear_references()
			vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
		end,
	})

	vim.diagnostic.config({
		virtual_text = false,
		underline = false,
		signs = true,
	})

	-- LSP servers and clients are able to communicate to each other what features they support.
	--  By default, Neovim doesn't support everything that is in the LSP specification.
	--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
	--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

	local servers = {
		gopls = {},
		expert = {},
		emmet_language_server = {
			filetypes = {
				"css",
				-- "heex",
				-- "eelixir",
				-- "phoenix-heex",
				-- "html-heex",
				"html",
				-- "elixir",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				-- "pug",
				"typescriptreact",
			},
		},
	}

	-- You can add other tools here that you want Mason to install
	-- for you, so that they are available from within Neovim.
	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"stylua", -- Used to format Lua code
	})
	-- Mason package name is 'emmet-language-server', but lspconfig name is 'emmet_language_server'
	for i, v in ipairs(ensure_installed) do
		if v == "emmet_language_server" then
			ensure_installed[i] = "emmet-language-server"
		end
	end
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	for name, server in pairs(servers) do
		server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
		vim.lsp.config(name, server)
		vim.lsp.enable(name)
	end

	vim.lsp.config("lua_ls", {
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = { "lua/?.lua", "lua/?/init.lua" },
				},
				workspace = {
					checkThirdParty = false,
					-- NOTE: this is a lot slower and will cause issues when working on your own configuration.
					--  See https://github.com/neovim/nvim-lspconfig/issues/3189
					library = vim.api.nvim_get_runtime_file("", true),
				},
			})
		end,
		settings = {
			Lua = {},
		},
	})
	vim.lsp.enable("lua_ls")
end
