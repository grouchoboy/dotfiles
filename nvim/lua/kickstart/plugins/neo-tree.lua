-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    {
      '<leader>ee',
      function()
        require('neo-tree.command').execute { toggle = true }
      end,
      desc = 'Explorer NeoTree (Root Dir)',
    },
    {
      '<leader>eb',
      function()
        require('neo-tree.command').execute { source = 'buffers', toggle = true }
      end,
      desc = 'Buffer Explorer',
    },
    -- { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
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
