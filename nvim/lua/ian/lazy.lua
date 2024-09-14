local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Example to setup for C++ and python
    --
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                toggler = {
                    ---Line-comment toggle keymap
                    line = '<C-c>',
                    ---Block-comment toggle keymap
                    block = 'gbc'
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = '<C-c>',
                    ---Block-comment keymap
                    block = 'gb'
                }
            })
        end
    }, "zapling/mason-conform.nvim",
    {'hat0uma/csvview.nvim', config = function() require('csvview').setup() end},
    'JoosepAlviste/nvim-ts-context-commentstring', {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim", "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim", "nvimtools/none-ls.nvim"
        },
        cmd = {"Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel"},
        keys = {
            {"<leader>la", ":Laravel artisan<cr>"},
            {"<leader>lr", ":Laravel routes<cr>"},
            {"<leader>lm", ":Laravel related<cr>"}
        },
        event = {"VeryLazy"},
        opts = {
            features = {
                null_ls = {enable = true},
                route_info = {
                    enable = true, --- to enable the laravel.nvim virtual text
                    position = 'right', --- where to show the info (available options 'right', 'top')
                    middlewares = true, --- wheather to show the middlewares section in the info
                    method = true, --- wheather to show the method section in the info
                    uri = true --- wheather to show the uri section in the info
                }
            }
        },
        config = true
    }, {
        'stevearc/conform.nvim',
        event = {"BufWritePre"},
        opts = {
            formatters_by_ft = {
                -- Modifiqué /home/ian/.local/share/nvim/lazy/conform.nvim/lua/conform/formatters/clang-format.lua
                cpp = {"clang-format"},
                php = {"pretty-php"},
                blade = {"blade-formatter"},
                python = {"black", "reorder-python-imports"},
                lua = {"lua-format"}
                -- blade = { "phpactor" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000
            }
        }
    }, {'stevearc/dressing.nvim', opts = {enabled = true, border = "rounded"}},
    {
        "A7lavinraj/assistant.nvim",
        dependencies = {"stevearc/dressing.nvim"},
        opts = {
            commands = {
                python = {
                    extension = "py",
                    compile = nil,
                    execute = {
                        main = "python3",
                        args = {"$FILENAME_WITH_EXTENSION"}
                    }
                },
                cpp = {
                    extension = "cpp",
                    compile = {
                        main = "g++",
                        args = {
                            "$FILENAME_WITH_EXTENSION", "-o",
                            "$FILENAME_WITHOUT_EXTENSION"
                        }
                    },
                    execute = {
                        main = "./$FILENAME_WITHOUT_EXTENSION",
                        args = nil
                    }
                }
            },
            time_limit = 5000,
            border = true -- border is OFF by default
        }
    }, {
        "luckasRanarison/tailwind-tools.nvim",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        opts = {} -- your configuration
    }, {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({color_square_width = 2})
        end
    }, 'jose-elias-alvarez/null-ls.nvim', -- 'MunifTanjim/prettier.nvim',
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            {'tpope/vim-dadbod', lazy = true},
            {'tpope/vim-dotenv', lazy = true}, {
                'kristijanhusak/vim-dadbod-completion',
                ft = {'sql', 'mysql', 'plsql'},
                lazy = true
            } -- Optional
        },
        cmd = {'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer'},
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end
    }, 'phpactor/phpactor', 'nanotee/sqls.nvim', -- lazy.nvim
    --[[
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
--]] -- {'numirias/semshi',run='UpdateRemotePlugins'},
    --
    --
    -- plugins/rest.lua
    -- 'mfussenegger/nvim-jdtls',
    --[[
    {
       "rest-nvim/rest.nvim",
       dependencies = { { "nvim-lua/plenary.nvim" } },
       config = function()
         require("rest-nvim").setup({
           --- Get the same options from Packer setup
        })
      end
    },
    --]] --[[
{
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    dependencies = { "nvim-lua/plenary.nvim", "vhyrro/luarocks.nvim", "nvim-neorg/lua-utils.nvim"},
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
},
--]] {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        dependencies = {
            "nvim-lua/plenary.nvim", "vhyrro/luarocks.nvim",
            "nvim-neorg/lua-utils.nvim"
        },
        build = ":Neorg sync-parsers",
        config = true
        --[[
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        },
        --]]
    }, -- 'nanotee/sqls.nvim',
    -- Database
    --[[
    {
        "kristijanhusak/vim-dadbod-ui",
      opt = true,
      requires = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
      },
      config = function()
        require("ian.plugins.dadbood").setup()
      end,
      cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    },
    --]] {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim", 's1n7ax/nvim-window-picker'
        }
    },
    -- "folke/which-key.nvim", --Las opciones de teclas de abajito (atajos de teclado)
    "folke/tokyonight.nvim", -- Theme
    'folke/trouble.nvim', -- Listado de diagnósticos
    -- 'vimwiki/vimwiki',   -- ------ Marckdown
    -- 'junegunn/goyo.vim', -- ZenMode
    'nvim-telescope/telescope.nvim', -------- telescope
    -- 'jiangmiao/auto-pairs',   --------- Autoclose brackets
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    }, 'christoomey/vim-tmux-navigator', --- navegavión
    'tamton-aquib/staline.nvim', -- Barra de estado
    'nanozuki/tabby.nvim', {
        'nanozuki/tabby.nvim',
        -- event = 'VimEnter', -- if you want lazy load, see below
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- 'sbdchd/neoformat', -- Formateador de código -- Agregar: --style=Microsoft ; a clang-format en .local/share/nvim/lazy/neoformat/autoload/neoformat/formatters/c.vim
    {
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({"n", "v"}, '<leader>xe',
                           require('nvim-emmet').wrap_with_abbreviation)
        end
    },
    -- 'turbio/bracey.vim', --  , {'do': 'npm install --prefix server'} -- live server html, css, javascript
    {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = {'LiveServerStart', 'LiveServerStop'},
        config = true
    }, 'junegunn/fzf', -- fzf
    'junegunn/fzf.vim', -- fzf
    'voldikss/vim-floaterm', -- Terminal flotante
    -- 'tomtom/tcomment_vim',                                        -- -----Comentarios
    {'rrethy/vim-hexokinase', build = 'make hexokinase'}, -- colores
    {"iamcco/markdown-preview.nvim"},
    -- { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
    -- vim snip para lsp texlab (latex)
    -- {'xuhdev/vim-latex-live-preview'},  --, { 'for': 'tex' }  --vim latex preview
    'hrsh7th/vim-vsnip', --[[
{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" }
},
--]] "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets",
    'saadparwaiz1/cmp_luasnip', 'hrsh7th/vim-vsnip-integ', 'lervag/vimtex',
    -- Lsp
    'neovim/nvim-lspconfig', 'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim', -- Completion
    'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp', 'onsails/lspkind.nvim'
    -- { "nvim-treesitter/nvim-treesitter", build = ":TSEnable highlight" },
    -- 'nvim-treesitter/nvim-treesitter',
}, {lazy = true})
