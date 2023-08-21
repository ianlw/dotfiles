require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
require("luasnip.loaders.from_lua").lazy_load({paths = "/home/ian/.config/nvim/lua/ian/snippets"})

vim.cmd[[" press <Tab> to expand or jump in a snippet. These can also be mapped separately]]
vim.cmd[[" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.]]
vim.cmd[[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]]
vim.cmd[[" -1 for jumping backwards.]]
vim.cmd[[inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>]]
vim.cmd[[snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>]]
vim.cmd[[snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>]]
vim.cmd[[" For changing choices in choiceNodes (not strictly necessary for a basic setup).]]
vim.cmd[[imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']]
vim.cmd[[smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']]