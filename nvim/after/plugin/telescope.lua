local telescope = require('telescope')

telescope.load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>c', builtin.commands, {})

-- LSP
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>lw', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>ltd', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})

vim.api.nvim_create_user_command("References", builtin.lsp_references, {})
vim.api.nvim_create_user_command("Implementations", builtin.lsp_implementations, {})


