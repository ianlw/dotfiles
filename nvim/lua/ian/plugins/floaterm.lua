vim.cmd [[let g:floaterm_borderchars='─│─│╭╮╯╰']]
vim.cmd [[let g:floaterm_title= " Terminal "]]
-- " let g:floaterm_title= $(echo -e '\033[1;3m' Terminal '\033[0m')
-- " hi FloatBorder guifg=#f08080 guibg=#1f2294 gui=bold,italic

-- " Set floaterm window's background to black
vim.cmd [[hi Floaterm guibg=NONE]]
-- " Set floating window border line color to cyan, and background to orange
vim.cmd [[hi FloatermBorder guibg=NONE guifg=#D5BDFF gui=bold,italic]]
-- "let g:floaterm_autoinsert=v:false
vim.cmd [[let g:floaterm_autoclose=0]]
vim.cmd [[tnoremap <Esc> <C-d>u]]
