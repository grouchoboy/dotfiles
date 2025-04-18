-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  -- init = function()
  --   -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
  --   -- because `cwd` is not set up properly.
  --   vim.api.nvim_create_autocmd('BufEnter', {
  --     group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
  --     desc = 'Start Neo-tree with directory',
  --     once = true,
  --     callback = function()
  --       if package.loaded['neo-tree'] then
  --         return
  --       else
  --         local stats = vim.uv.fs_stat(vim.fn.argv(0))
  --         if stats and stats.type == 'directory' then
  --           require('neo-tree.command').execute { action = 'focus' }
  --           -- require 'neo-tree'
  --         end
  --       end
  --     end,
  --   })
  -- end,
  keys = {
    {
      '<leader>ex',
      function()
        require('neo-tree.command').execute { action = 'close' }
      end,
      desc = 'Explorer NeoTree (Root Dir)',
    },
    {
      '<leader>ef',
      function()
        require('neo-tree.command').execute { toggle = false, position = 'current' }
      end,
      desc = 'Explorer NeoTree (Root Dir)',
    },
    {
      '<leader>ee',
      function()
        require('neo-tree.command').execute { toggle = false, position = 'left' }
      end,
      desc = 'Explorer NeoTree (Root Dir)',
    },
    {
      '<leader>eb',
      function()
        require('neo-tree.command').execute { source = 'buffers', toggle = false }
      end,
      desc = 'Buffer Explorer',
    },
    -- { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    enable_git_status = false,
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        visible = true,
        hiden_dotfiles = false,
      },
    },
  },
}
