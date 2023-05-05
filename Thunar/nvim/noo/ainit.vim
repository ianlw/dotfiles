"Source
" so /home/ian/.config/nvim/keymaps_compiler.vim
""dofiguración general
filetype indent plugin on
" set pumblend=200
set nowrap
set undofile
" set textwidth=5
" set wrapmargin=10
set laststatus=3
set ai
set cindent
set mouse=a
set clipboard+=unnamedplus
set number
set relativenumber
set numberwidth=2
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set shortmess+=c
set autoindent
set linebreak
set cursorline
set termguicolors
set nocompatible
set splitbelow
filetype plugin on
syntax on
set signcolumn=number
" ·· tabline
"let g:airline#extension#tabline#enable=1

"Plugins
call plug#begin('~/.local/share/nvim/plugged')
    " Plug 'ziontee113/neo-minimap'
    Plug 's1n7ax/nvim-window-picker'
    Plug 'nvim-neo-tree/neo-tree.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'maan2003/lsp_lines.nvim'
    " Plug 'lunarvim/horizon.nvim'
    " Plug 'voldikss/vim-floaterm'
    " Plug 'junegunn/goyo.vim'
    " Plug 'navarasu/onedark.nvim'
    " Plug 'sainnhe/sonokai'
    " Plug 'sainnhe/edge'
    " Plug 'drewtempelmeyer/palenight.vim'
    " Plug 'mhartington/oceanic-next'
    " Plug 'rakr/vim-one'
    " Plug 'jacoborus/tender.vim'
    " Plug 'chriskempson/base16-vim' 
    " Plug 'gosukiwi/vim-atom-dark'
	" Plug 'vimwiki/vimwiki'  " -------- Marckdown
    " Plug 'mattn/calendar-vim' " ------ Calendar
	" Plug 'morhetz/gruvbox'  " -------- Tema
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }  " -- Tema
    " Plug 'preservim/nerdtree'  " ----- Árbol de archivos
    " " Plug 'nvim-neo-tree/neo-tree.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'MunifTanjim/nui.nvim'
    " Plug 'frazrepo/vim-rainbow'  " --- Coloreo de parentesis, corchetes, etc.
    Plug 'kyazdani42/nvim-web-devicons'  " --- Iconos 
    Plug 'ryanoasis/vim-devicons' " --- Iconos
"    Plug 'tribela/vim-transparent'  " ----- transparencia
"    Plug 'xiyaowong/nvim-transparent'  " --- transparencia
    Plug 'nvim-lua/plenary.nvim'  " ------ lua
    Plug 'nvim-telescope/telescope.nvim'  " -------- telescope 
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}  " --- Autocompletado 
    Plug 'jiangmiao/auto-pairs'  " --------- Autoclose brackets
"    Plug 'datwaft/bubbly.nvim'  " satatusline
"    Plug 'beauwilliams/statusline.lua'    
"    Plug 'tamton-aquib/staline.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'christoomey/vim-tmux-navigator' " --- navegavión
    Plug 'tamton-aquib/staline.nvim' " ---- 
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } " vim latex preview
"    Plug 'tpope/vim-commentary' " - ---- Comentarios
    Plug 'tomtom/tcomment_vim' " -----Comentarios
"    Plug 'norcalli/nvim-colorizer.lua' " -----colores en html,rgb, dfsdfsasdfg
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " colores
    Plug 'sbdchd/neoformat'
    Plug 'bfrg/vim-cpp-modern' " Syntaxis de c++
    Plug 'mattn/emmet-vim'
    Plug 'yggdroot/indentline' " lineas de identación 
    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} " live server html, css, javascript
    Plug 'OmniSharp/omnisharp-vim' " C#
    Plug 'dense-analysis/ale'
    Plug 'junegunn/fzf.vim'
    " Plug 'nickspoons/vim-sharpenup'
    Plug 'nanozuki/tabby.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " highlight

    " Lsp
    Plug 'neovim/nvim-lspconfig'
    " Completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind.nvim'
    " Vim snip para lsp texlab (latex)
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'lervag/vimtex'

call plug#end()


" floating terminal
let g:floaterm_borderchars='─│─│╭╮╯╰'
let g:floaterm_title= " Terminal "
" let g:floaterm_title= $(echo -e '\033[1;3m' Terminal '\033[0m')
" hi FloatBorder guifg=#f08080 guibg=#1f2294 gui=bold,italic

" Set floaterm window's background to black
hi Floaterm guibg=NONE
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=NONE guifg=#D5BDFF gui=bold,italic
"let g:floaterm_autoinsert=v:false
let g:floaterm_autoclose=0
tnoremap <Esc> <C-d>

" ltex
autocmd BufRead,BufNewFile *.org set filetype=org

lua << EOF
-- require'lspconfig'.pyright.setup{}
EOF

" Ale 
" let g:ale_linters = {
" \   'cs': ['HomniSharp'],
" \} 
let g:indentLine_fileTypeExclude = ['tex']
let b:ale_linters = ['alex']
"bracey.vim
let g:bracey_refresh_on_save=1
" indentline
let g:indentLine_setColors = 1 
let g:indentLine_char = '▏'
"let g:indentLine_char_list = ['▏', '¦', '┆', '┊']

" Emmet
let g:user_emmet_mode='i'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={'javascript':{'extends':'jsx'}}

"tema
" colorscheme tokyonight
" let g:onedark_config = {
"     \ 'style': 'darker',
"     \ 'trasparent': 'false',
" \}
" colorscheme sonokai
"
" lua << EOF
" require('onedark').setup{
"     style = 'dark',
"     transparent = true,
"     code_style = {
"         comments = 'none',
"         keywords = 'italic',
"         functions = 'italic',
"         strings = 'italic',
"         variables = 'italic'
"     },
" }
" EOF

lua << EOF
    require('tokyonight').setup ({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = true },
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false,  -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors) end,
    })
EOF

colorscheme tokyonight
"colorscheme horizon



"let g:airline_theme='bubbly'
" let g:gruvbox_italicize_comments = '1'
" let g:gruvbox_italicize_strings = '1'
" let g:gruvbox_invert_selection = '1'
" let g:airline_powerline_fonts=1

" Raimbow
" let g:rainbow_active = 0

" let g:rainbow_load_separately = [
"     \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"     \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"     \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"     \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
"     \ ]
"
" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
" let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"Tab
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
filetype indent on
"set termwinsize=10x0

"Atajos de teclado
let mapleader=","
"nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>t :Neotree toggle<CR>
nmap <Leader>y :Telescope find_files<CR>
map <F2> :setlocal spell! spelllang=es <Enter>
map <F3> :setlocal spell! spelllang=en <Enter>
map <F10> :split<CR>:ter<CR>:resize 15<CR><Esc>i
"inoremap < <><Esc>i
"map <C-c> :s/^/\/\//<Enter>
"map <C-u> :s/^\/\///<Enter>
nnoremap <Leader>l :vertical resize +2<CR>
nnoremap <Leader>h :vertical resize -2<CR>
nnoremap <Leader>k :resize +2<CR>
nnoremap <Leader>j :resize -2<CR>

" borrar palabra
nnoremap <C-BACKSPACE> vbd
imap <C-BACKSPACE> <Esc>vbdi
" nnoremap <C-BACKSPACE> db
" imap <C-BACKSPACE> <Esc>dbi
nnoremap <C-Del> dw
imap <C-Del> <Esc>dwi

" Select all dasd
" nmap <C-a> gg<S-v>G


"vimwiki config
let g:vimwiki_listsyms = ' ○◐●✓'
" Vim Wiki
let g:vimwiki_list = [{'path': '~/Sync/wiki/', 'syntax': 'markdown'}]
au FileType vimwiki setlocal shiftwidth=3 tabstop=3 noexpandtab

"let g:vimwiki_list = [{
"        \ 'path': '~/vimwiki',
"        \ 'template_path': '~/vimwiki/templates/',
"        \ 'template_default': 'default',
"        \ 'syntax': 'markdown',
"        \ 'ext': '.md',
"        \ 'path_html': '~/vimwiki/site_html/',
"        \ 'custom_wiki2html': 'vimwiki_markdown',
"        \ 'template_ext': '.tpl'}]





"Navigatig with guides
" inoremap ;gui 
" inoremap <leader><TAB> <Esc>/<Enter>"_c4l
" inoremap <leader><S-TAB> <Esc>?<++><Enter>"_c4l
" vnoremap <leader><TAB> <Esc>/<++><Enter>"_c4l
" vnoremap <leader><S-TAB> <Esc>/<++><Enter>"_c4l
" map <leader><TAB> <Esc>/<++><Enter>"_c4l
" map <leader><S-TAB> <Esc>/<++><Enter>"_c4l

"Agregar plantillas
autocmd FileType vimwiki nnoremap ,d :-1read $HOME/.config/nvim/scripts/date.wiki<CR>
"autocmd FileType vimwiki let g:rainbow_active=0
" Rainbow ----- no puedo configurarlo para que esté desactivado en vimwiki
"au FileType c,cpp,objc,objcpp,py,html,css,javascript call rainbow#load()

" Latex preview pdf
let g:livepreview_previewer = 'zathura'
nnoremap <leader>c :LLPStartPreview<CR>




" ▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼.▼
"
" Colores personalizados
" 
" ▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲˙▲

hi VimwikiHeader1 term=bold ctermfg=Red guifg=#a9edeb gui=bold
hi VimwikiHeader2 term=bold ctermfg=Red guifg=#f7ed9e gui=bold
hi VimwikiHeader3 term=bold ctermfg=Red guifg=#f1c073 gui=bold
hi VimwikiHeader4 term=bold ctermfg=Red guifg=#ef68c7 gui=bold
hi VimwikiHeader5 term=bold ctermfg=Red guifg=#b2a4eb gui=bold
hi VimwikiHeader6 term=bold ctermfg=Red guifg=#AB65AF gui=bold
hi VimwikiLink gui=underline cterm=underline guifg=#6FADED
hi Comment ctermfg=243 guifg=#65737e gui=italic
hi VimwikiDelText term=bold guifg=#FF3A72 gui=bold,italic
" hi FloatBorder guifg=#3d59a1 guibg=none
hi Pmenu ctermfg=0 ctermbg=13 guifg=#c0caf5 guibg=NONE
" hi LspFloatWinNormal guibg=none
" hi NormalFloat guibg=none
" hi CmpDocumentationBorder guibg=none
" hi CmpDocumentation guibg=none
" hi TabLine guibg=NONE
" hi debugPC guibg=NONE
" hi WhichKeyFloat guibg=NONE
" hi BufferVisibleIndex guibg=NONE
" hi SignColumnSB guibg=NONE
" hi NormalSB guibg=NONE
highlight NormalFloat guibg=NONE

"highlight FloatBorder guifg=#f08080 guibg=NONE
highlight FloatBorder guifg=#FF7CB5 guibg=NONE

" hi Pmenu ctermfg=0 ctermbg=13 guifg=#f08080
"
"LSP diagnostic
hi DiagnosticVirtualTextError guibg=none gui=italic
hi DiagnosticVirtualTextWarn guibg=none gui=italic 
hi DiagnosticVirtualTextInfo guibg=none gui=italic 
hi DiagnosticVirtualTextHint guibg=none gui=italic


lua << EOF
require('staline').setup{
	sections = {
		left = {
    		' ', 'right_sep', '-mode', 'left_sep', ' ',
			'right_sep', '-file_name', 'left_sep', ' ', 'branch'
		},
		mid  = {'lsp',},
		right= {
       		'right_sep', '-cool_symbol', 'left_sep',
			' ', 'right_sep', '-line_column', 'left_sep', ' ',
		}
	},

	defaults={
       fg = "#000000",
		cool_symbol = " ",
		left_separator = "",
		right_separator = "",
		-- line_column = "%l:%c [%L]",
		true_colors = true,
		line_column = "[%l:%c] 並%L% ",
		-- font_active = "bold",
        -- inactive_color  = "none",
        -- inactive_bgcolor = "none",
        true_colors     = true,
	},
	mode_colors = {
		n  = "#c2caff",
		i  = "#ff7cb5",
		ic = "#ffc8f4",
		c  = "#ce0249",
		v  = "#ffc4a9"       -- etc
	}
}

-- vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if file == "neo_tree filesystem [1]" | set laststatus=0 | else | set laststatus=2 | endif]]

--[[
require('stabline').setup{
	style       = "bubble", -- others: arrow, slant, bubble
   stab_left   = "",
	stab_right  = " ",

	fg          = "#000000",
	bg = "#e41061",
    inactive_bg = "#c2caff",
	inactive_fg = "#282828",
	-- stab_bg     = Default is darker version of bg.,

	font_active = "bold",
    font_inactive = "italic",
	exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
	stab_start  = "",   -- The starting of stabline
	stab_end    = "",
}
--]]


local theme = {
  -- fill = 'TabLineFill',
  fill = { fg=none, bg=none, style='italic' },
  head = 'TabLine',
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
        tab.close_btn(''),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
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
  }
end)


EOF


" for transparent background
"function! AdaptColorscheme()
"   highlight clear CursorLine
"   highlight Normal ctermbg=none
"   highlight LineNr ctermbg=none
"   highlight Folded ctermbg=none
"   highlight NonText ctermbg=none
"   highlight SpecialKey ctermbg=none
"   highlight VertSplit ctermbg=none
"   highlight SignColumn ctermbg=none
"endfunction
"autocmd ColorScheme * call AdaptColorscheme()
"
"highlight Normal guibg=NONE ctermbg=NONE
"highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
"highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
"highlight clear LineNr
"highlight clear SignColumn
highlight clear StatusLine


"Change Color when entering Insert Mode
"autocmd InsertEnter * set nocursorline

" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * set nocursorline

"" extra settings, uncomment them if necessary :) 
"set cursorline
"set noshowmode
"set nocursorline

" trasparent end
"
"
" Comment
vmap <C-c> :TCommentBlock<CR>
nmap <C-c> :TComment<CR>

" Colores de hexpkinase
let g:Hexokinase_highlighters = ['virtual']



set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'



  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      -- completion ={
      -- border = {'╭', '─', '╮', '|', '╯', '─', '╰', '|'},
      -- scrollbar = '║',
      -- },
      documentation = cmp.config.window.bordered(),
      -- documentation = {
      -- border = border,
      -- scrollbar = '',
      -- },
    },
    mapping = cmp.mapping.preset.insert({
      ['<S-TAB>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ['<TAB>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Up>'] = cmp.mapping.abort(),
      ['<Down>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline({
      -- ['<S-TAB>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      -- ['<TAB>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
  }),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
      -- ['<S-TAB>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      -- ['<TAB>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
}),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities}
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['csharp_ls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['bashls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['texlab'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['ltex'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    -- Para el root directory
    root_dir = function() return vim.loop.cwd() end,
    -- filetypes = {"html"}
  }
  require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['vimls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['cssls'].setup {
    capabilities = capabilities
  }

  require("mason").setup()
require("mason-lspconfig").setup()



require("cmp").setup({
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:Pmenu",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end,
  },
})


vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
  }
})

-- Lsp colors diagnostics
vim.cmd [[
  highlight! DiagnosticLineNrError guibg=none guifg=#FF0000 gui=bold,italic
  highlight! DiagnosticLineNrWarn guibg=none guifg=#FFA500 gui=bold,italic
  highlight! DiagnosticLineNrInfo guibg=none guifg=#00FFFF gui=bold,italic
  highlight! DiagnosticLineNrHint guibg=none guifg=#0000FF gui=bold,italic

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]


local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
require("lsp_lines").setup(
    vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true },
})
)

require("trouble").setup{
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}


-- neo-tree
 require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })


-- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "", texthl = "DiagnosticSignHint"})
      -- NOTE: this is changed from v1.x, which used the old style of highlight groups
      -- in the form "LspDiagnosticsSignWarning"

      require("neo-tree").setup({
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        sort_function = nil , -- use a custom function for sorting files and directories in the tree 
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- this sorts files and directories descendantly
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "╰",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
        window = {
          position = "right",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<space>"] = { 
                "toggle_node", 
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = { 
              "add",
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none" -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          }
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
              --"node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
              --"*.meta",
              --"*/src/*/tsconfig.json",
            },
            always_show = { -- remains visible even if other settings would normally hide it
              --".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              --".DS_Store",
              --"thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
              --".null-ls_*",
            },
          },
          follow_current_file = true, -- This will find and focus the file in the active buffer every
                                       -- time the current file is changed while the tree is open.
          group_empty_dirs = false, -- when true, empty folders will be grouped together
          hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                                                  -- in whatever position is specified in window.position
                                -- "open_current",  -- netrw disabled, opening a directory opens within the
                                                  -- window like netrw would, regardless of window.position
                                -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
          use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                          -- instead of relying on nvim autocmd events.
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["D"] = "fuzzy_finder_directory",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
            }
          }
        },
        buffers = {
          follow_current_file = true, -- This will find and focus the file in the active buffer every
                                       -- time the current file is changed while the tree is open.
          group_empty_dirs = true, -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            }
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            }
          }
        }
      })

      vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

EOF
