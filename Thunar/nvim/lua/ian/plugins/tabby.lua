vim.cmd[[hi TabLineSel guifg=#1d202f guibg=#7aa2f7 gui=italic,bold]]
local theme = {
  -- fill = 'TabLineFill',
  fill = { fg=none, bg=none, style='italic' },
  head = 'TabLine',
  -- current_tab = 'TabLineSel',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}
require('tabby.tabline').set(function(line)
  return {
    {
      { '', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.is_current() and '' or '',
        tab.number(),
        tab.name(),
        -- tab.close_btn(''),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    --[[
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep('', theme.win, theme.fill),
        win.is_current() and '' or '',
        win.buf_name(),
        line.sep(' ', theme.win, theme.fill),
        hl = theme.win,
        margin = ' ',
      }
    end),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
      line.sep('', theme.tail,theme.fill),
    },
    hl = theme.fill,
    --]]
  }
end)

-- vim.cmd[[let g:limelight_conceal_ctermfg = 'gray']]
-- vim.cmd[[let g:limelight_conceal_ctermfg = 240]]
vim.cmd[[let g:limelight_conceal_guifg = 'DarkGray']]
vim.cmd[[let g:limelight_conceal_guifg = '#383D55']]
vim.cmd[[let g:limelight_default_coefficient = 0.7]]
vim.cmd[[let g:limelight_paragraph_span = 0]]
vim.cmd[[let g:limelight_bop = '^\s']]
vim.cmd[[let g:limelight_eop = '\ze\n^\s']]
vim.cmd[[let g:limelight_priority = -1]]
