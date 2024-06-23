vim.cmd[[hi TabLineSel guifg=#1d202f guibg=#7AA2F7 gui=italic,bold]]
-- vim.cmd[[hi TabbyHL_7aa2f7_NONE_NONE guifg=#C2CAFF]]
local theme = {
  -- fill = 'TabLineFill',
  fill = { fg="#C2CAFF", bg=none, style='italic' },
  head = 'TabLineSel',
  -- current_tab = 'TabLineSel',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

require('tabby').setup({
  line = function(line)
    return {
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep('', hl, theme.fill),
          tab.name(),
          line.sep('', hl, theme.fill),
          hl = hl,
          margin = ' ',
        }
      end),


      line.spacer(),
      hl = theme.fill,
    }
  end,
  -- option = {}, -- setup modules' option,
})

vim.cmd[[let g:limelight_conceal_ctermfg = 'gray']]
vim.cmd[[let g:limelight_conceal_ctermfg = 240]]
vim.cmd[[let g:limelight_conceal_guifg = 'DarkGray']]
vim.cmd[[let g:limelight_conceal_guifg = '#383D55']]
vim.cmd[[let g:limelight_default_coefficient = 0.7]]
vim.cmd[[let g:limelight_paragraph_span = 0]]
vim.cmd[[let g:limelight_bop = '^\s']]
vim.cmd[[let g:limelight_eop = '\ze\n^\s']]
vim.cmd[[let g:limelight_priority = -1]]
