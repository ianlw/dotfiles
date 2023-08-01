local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {'nvim-neo-tree/neo-tree.nvim', branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      's1n7ax/nvim-window-picker'
    },},
    "folke/which-key.nvim", --Las opciones de teclas de abajito (atajos de teclado)
    "folke/tokyonight.nvim", -- Theme
    'folke/trouble.nvim', -- Listado de diagnósticos
    'vimwiki/vimwiki',   -- ------ Marckdown
    'junegunn/goyo.vim', -- ZenMode
    'nvim-telescope/telescope.nvim',   -------- telescope 
    'jiangmiao/auto-pairs',   --------- Autoclose brackets
    'christoomey/vim-tmux-navigator',  --- navegavión
    'tamton-aquib/staline.nvim',  -- Barra de estado
    'nanozuki/tabby.nvim',
    'ryanoasis/vim-devicons',  --- Iconos
    'sbdchd/neoformat', -- Formateador de código
    'mattn/emmet-vim', -- snip for html
    'turbio/bracey.vim', --  , {'do': 'npm install --prefix server'} -- live server html, css, javascript
    'junegunn/fzf.vim', -- fzf
    'voldikss/vim-floaterm', -- Terminal flotante
    'tomtom/tcomment_vim', -- -----Comentarios
    {'rrethy/vim-hexokinase', build = 'make hexokinase' }, -- colores
    {"iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end,},
    -- { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
    -- vim snip para lsp texlab (latex)
    -- {'xuhdev/vim-latex-live-preview'},  --, { 'for': 'tex' }  --vim latex preview
    'hrsh7th/vim-vsnip',
{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" }
},
    -- "rafamadriz/friendly-snippets",
    'saadparwaiz1/cmp_luasnip',

    'hrsh7th/vim-vsnip-integ',
    'lervag/vimtex',
    -- Lsp
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- Completion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'onsails/lspkind.nvim',
    'nvim-treesitter/nvim-treesitter',
    'numToStr/Comment.nvim',
})
