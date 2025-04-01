return function()
  vim.o.background = 'light'

  local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  local p = {
    dark0_hard = '#1d2021',
    dark0 = '#282828',
    dark0_soft = '#32302f',
    dark1 = '#3c3836',
    dark2 = '#504945',
    dark3 = '#665c54',
    dark4 = '#7c6f64',
    light0_hard = '#f9f5d7',
    light0 = '#fbf1c7',
    light0_soft = '#f2e5bc',
    light1 = '#ebdbb2',
    light2 = '#d5c4a1',
    light3 = '#bdae93',
    light4 = '#a89984',
    bright_red = '#fb4934',
    bright_green = '#b8bb26',
    bright_yellow = '#fabd2f',
    bright_blue = '#83a598',
    bright_purple = '#d3869b',
    bright_aqua = '#8ec07c',
    bright_orange = '#fe8019',
    neutral_red = '#cc241d',
    neutral_green = '#98971a',
    neutral_yellow = '#d79921',
    neutral_blue = '#458588',
    neutral_purple = '#b16286',
    neutral_aqua = '#689d6a',
    neutral_orange = '#d65d0e',
    faded_red = '#9d0006',
    faded_green = '#79740e',
    faded_yellow = '#b57614',
    faded_blue = '#076678',
    faded_purple = '#8f3f71',
    faded_aqua = '#427b58',
    faded_orange = '#af3a03',
    dark_red_hard = '#792329',
    dark_red = '#722529',
    dark_red_soft = '#7b2c2f',
    light_red_hard = '#fc9690',
    light_red = '#fc9487',
    light_red_soft = '#f78b7f',
    dark_green_hard = '#5a633a',
    dark_green = '#62693e',
    dark_green_soft = '#686d43',
    light_green_hard = '#d3d6a5',
    light_green = '#d5d39b',
    light_green_soft = '#cecb94',
    dark_aqua_hard = '#3e4934',
    dark_aqua = '#49503b',
    dark_aqua_soft = '#525742',
    light_aqua_hard = '#e6e9c1',
    light_aqua = '#e8e5b5',
    light_aqua_soft = '#e1dbac',
    gray = '#928374',
  }

  local colors = {
    bg0 = p.light0,
    bg1 = p.light1,
    bg2 = p.light2,
    bg3 = p.light3,
    bg4 = p.light4,
    fg0 = p.dark0,
    fg1 = p.dark1,
    -- text = p.dark1,
    text = '#000000',
    -- base = p.light0_hard,
    base = '#ffffea', -- acme yellow
    fg2 = p.dark2,
    fg3 = p.dark3,
    fg4 = p.dark4,
    red = p.faded_red,
    green = p.faded_green,
    yellow = p.faded_yellow,
    blue = p.faded_blue,
    purple = p.faded_purple,
    aqua = p.faded_aqua,
    orange = p.faded_orange,
    neutral_red = p.neutral_red,
    neutral_green = p.neutral_green,
    neutral_yellow = p.neutral_yellow,
    neutral_blue = p.neutral_blue,
    neutral_purple = p.neutral_purple,
    neutral_aqua = p.neutral_aqua,
    dark_red = p.light_red,
    dark_green = p.light_green,
    dark_aqua = p.light_aqua,
    gray = p.gray,
    overlay0 = p.gray,
    -- surface0 = p.light1,
    surface0 = p.light0_hard,
    gruvbox_red = '#7b2c2f',
    gruvbox_string = '#686d43',
  }
  -- Set general UI highlights
  set_hl('Normal', { fg = colors.text, bg = colors.base })
  set_hl('Comment', { fg = colors.overlay0 })
  set_hl('Constant', { fg = colors.text })
  -- set_hl('String', { fg = colors.text })
  set_hl('String', { fg = colors.gruvbox_string })
  set_hl('Identifier', { fg = colors.text })
  -- set_hl('Statement', { fg = colors.text })
  set_hl('Statement', { fg = colors.gruvbox_red })
  set_hl('PreProc', { fg = colors.text })
  set_hl('Type', { fg = colors.text })
  set_hl('Special', { fg = colors.text })
  set_hl('Function', { fg = colors.text })
  set_hl('Delimiter', { fg = colors.text })
  set_hl('@variable', { fg = colors.text })
  set_hl('Title', { fg = colors.text })
  set_hl('Operator', { fg = colors.text })
  set_hl('CursorLine', { bg = colors.surface0, fg = colors.text })
  set_hl('LineNr', { fg = colors.surface1 })
  set_hl('LineNr', { fg = colors.overlay0 })
  set_hl('StatusLine', { fg = colors.text, bg = colors.base })
  set_hl('StatusLineNC', { fg = colors.surface1, bg = colors.base })
  -- set_hl('MatchParen', { bg = colors.text, fg = colors.base, bold = false })

  -- Apply highlights for diagnostics (errors, warnings, etc.)
  set_hl('DiagnosticError', { fg = colors.red })
  set_hl('DiagnosticWarn', { fg = colors.yellow })
  set_hl('DiagnosticInfo', { fg = colors.blue })
  set_hl('DiagnosticHint', { fg = colors.cyan })

  -- Neotree
  set_hl('NeoTreeDirectoryIcon', { fg = colors.text })
  set_hl('NeoTreeDirectoryName', { fg = colors.text })

  -- Mini Statusline
  set_hl('MiniStatuslineModeInsert', { bg = colors.gray })
  set_hl('MiniStatuslineModeCommand', { bg = colors.base })
  set_hl('MiniStatuslineDevinfo', { bg = colors.overlay0 })
  set_hl('MiniStatuslineFilename', { bg = colors.overlay0 })
  set_hl('MiniStatuslineFileinfo', { bg = colors.overlay0 })

  set_hl('Visual', { bg = colors.surface0 })
  set_hl('NormalFloat', { bg = colors.surface0 })
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = colors.surface0, fg = colors.text })
end
