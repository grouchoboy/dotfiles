return function()
  local ls = require 'luasnip'
  local s = ls.snippet
  local t = ls.text_node
  local i = ls.insert_node
  local fmt = require('luasnip.extras.fmt').fmt

  ls.add_snippets('html', {
    s('echa', {
      t '{{',
      i(1),
      t '}}',
    }),
    s(
      'de',
      fmt(
        [[
            {{{{{}}}}}
                {}
            {{{{{}}}}}
            ]],
        { i(1), i(2), i(3, 'end') }
      )
    ),
  })
end
