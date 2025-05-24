return {
  'folke/snacks.nvim',
  ---@type snaks.Config
  opts = {
    explorer = {
      auto_open = true,
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {},
      },
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
  },
}
