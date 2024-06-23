--require('ian.packer-config')
require('ian.core.settings')
require('ian.lazy')
require('ian.core.keymaps')
require('ian.core.keymaps-compiler')
require('ian.core.colors')
--require('ian.packer-config')
require('ian.core.colorscheme')
-- require('Comment')
require('ian.plugins.staline')
require('ian.plugins.neotree')
require('ian.plugins.lsp')
require('ian.plugins.tabby')
require('ian.plugins.hexokinase')
require('ian.plugins.floaterm')
-- require('ian.plugins.zenmode')
require('ian.plugins.latex-preview')
-- require('plugins')
-- require('ian.plugins.luasnip')
-- require('ian.plugins.dadbood.lua')
-- require('ian.plugins.neorg')
require('ian.plugins.vimtex')
-- require('ian.plugins.rest')
require('ian.plugins.treesitter')
-- require('ian.plugins.noice')

vim.cmd [[luafile /home/ian/.config/nvim/lua/ian/core/colors.lua]] -- Para que funcionen los colores

-- bracey
-- vim.cmd[[let g:bracey_refresh_on_save=1]]

-- emmet
-- vim.cmd[[let g:user_emmet_mode='i']]
-- vim.cmd[[let g:user_emmet_leader_key=',']]
-- vim.cmd[[let g:user_emmet_settings={'javascript':{'extends':'jsx'}}]]

--Identline
--[[
-- vim.cmd[[let g:indentLine_setColors = 1]]
-- vim.cmd[[let g:indentLine_char = '▏']]
--vim.cmd[[let g:indentLine_color_gui = '#A4E57E']]
-- vim.cmd[[let g:indentLine_concealcursor = 'inc']]
-- vim.cmd[[let g:indentLine_conceallevel = 2]]
--vim.cmd[[let g:indentLine_fileTypeExclude = ['tex'] ]]
--vim.cmd[[let g:indentLine_fileTypeExclude = ['md'] ]]
--
vim.cmd[[nnoremap gf <C-W>gf]]
vim.cmd [[ autocmd BufRead,BufNewFile *.asm set filetype=nasm ]] -- latex lsp
vim.cmd [[ autocmd VimEnter * TSEnable highlight ]] -- latex lsp

--vim.cmd([[
--highlight MySpecialText cterm=bold gui=bold guifg=#ff0000
--]])
--vim.cmd([[
--match MySpecialText /=\zs.*\ze=/
--]])
vim.cmd[[set nolazyredraw]]
