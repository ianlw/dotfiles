local o = vim.o
local wo = vim.wo
wo.number = true
o.clipboard = "unnamedplus"
o.splitbelow = true
-- o.hidden = true 
o.lazyredraw = true -- Que no reescriba toda la pantalla al guardar 

vim.cmd [[ set shortmess+=caoOtI ]]
vim.cmd [[ set cmdheight=1 ]]
vim.o.wrap = false
vim.o.undofile = true
vim.o.laststatus = 3
vim.o.ai = true
--vim.opt.cident = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
--vim.opt.encoding = utf-8
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.shortmess = c
vim.o.autoindent = true
vim.o.linebreak = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.splitbelow = true
vim.opt.signcolumn = 'yes:1'
-- vim.opt.signcolumn = 'number'
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
-- vim.opt = true

vim.api.nvim_command('filetype plugin indent on')
vim.cmd [[ autocmd BufRead,BufNewFile *.org set filetype=org ]] -- latex lsp

