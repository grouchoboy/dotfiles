return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    local bg = '#ffffea'
    require('gruvbox').setup {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = 'hard', -- can be "hard", "soft" or empty string
      palette_overrides = {
        light0_hard = bg,
      },
      overrides = {
        SignColumn = { bg = bg },
        LineNr = { bg = bg },
        CursorLine = { bg = '#f9f5d7' },
        CursorLineNr = { bg = bg },
        DiagnosticSignError = { bg = bg },
        DiagnosticSignWarn = { bg = bg },
        DiagnosticSignInfo = { bg = bg },
        DiagnosticSignHint = { bg = bg },
      },
      dim_inactive = false,
      transparent_mode = false,
    }
    vim.o.background = 'light'
    vim.cmd 'colorscheme gruvbox'

    -- local colors = require 'custom.plugins.colors'
    -- colors()
  end,
}
