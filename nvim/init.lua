-- require('ian.packer-config')
require('ian.core.settings')
require('ian.lazy')
require('ian.core.keymaps')
require('ian.core.keymaps-compiler')
require('ian.core.colors')
-- require('ian.packer-config')
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
require('ian.plugins.null-ls')
-- require('ian.plugins.prettier')
require('ian.plugins.conform')

vim.cmd [[luafile /home/ian/.config/nvim/lua/ian/core/colors.lua]] -- Para que funcionen los colores

-- bracey
-- vim.cmd[[let g:bracey_refresh_on_save=1]]

-- emmet
-- vim.cmd[[let g:user_emmet_mode='i']]
-- vim.cmd[[let g:user_emmet_leader_key=',']]
-- vim.cmd[[let g:user_emmet_settings={'javascript':{'extends':'jsx'}}]]

-- Identline
--[[
-- vim.cmd[[let g:indentLine_setColors = 1]]
-- vim.cmd[[let g:indentLine_char = '▏']]
-- vim.cmd[[let g:indentLine_color_gui = '#A4E57E']]
-- vim.cmd[[let g:indentLine_concealcursor = 'inc']]
-- vim.cmd[[let g:indentLine_conceallevel = 2]]
-- vim.cmd[[let g:indentLine_fileTypeExclude = ['tex'] ]]
-- vim.cmd[[let g:indentLine_fileTypeExclude = ['md'] ]]
--
vim.cmd [[nnoremap gf <C-W>gf]]
vim.cmd [[ autocmd BufRead,BufNewFile *.asm set filetype=nasm ]] -- latex lsp
vim.cmd [[ autocmd VimEnter * TSEnable highlight ]]
vim.cmd [[ autocmd VimEnter * TSEnable indent ]]
vim.cmd [[ autocmd VimEnter * TSEnable ts_context_commentstring ]]

-- vim.cmd([[
-- highlight MySpecialText cterm=bold gui=bold guifg=#ff0000
-- ]])
-- vim.cmd([[
-- match MySpecialText /=\zs.*\ze=/
-- ]])
-- vim.cmd [[set nolazyredraw]]
--[[
require("cmp").config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}
--]]
require("tailwind-tools").setup({
    document_color = {
        enabled = true, -- can be toggled by commands
        kind = "inline", -- "inline" | "foreground" | "background"
        inline_symbol = "󰝤 ", -- only used in inline mode
        debounce = 200 -- in milliseconds, only applied in insert mode
    },
    conceal = {
        enabled = false, -- can be toggled by commands
        min_length = nil, -- only conceal classes exceeding the provided length
        symbol = "󱏿", -- only a single character is allowed
        highlight = { -- extmark highlight options, see :h 'highlight'
            fg = "#38BDF8"
        }
    },
    -- see the extension section to learn more
    extension = {
        queries = {}, -- a list of filetypes having custom `class` queries
        patterns = { -- a map of filetypes to Lua pattern lists
            -- exmaple:
            -- rust = { "class=[\"']([^\"']+)[\"']" },
            -- javascript = { "clsx%(([^)]+)%)" },
        }
    }
})
-- in my settings
-- Filetypes --
vim.filetype.add({pattern = {['.*%.blade%.php'] = 'blade'}})
local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main"
    },
    filetype = "blade"
}

vim.cmd [[
" Set the *.blade.php file to be filetype of blade
augroup BladeFiltypeRelated
  au BufNewFile,BufRead *.blade.php set ft=blade
augroup END
]]

-- local ft = require('Comment.ft')
-- ft.php = '//%s'

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args) require("conform").format({bufnr = args.buf}) end
})
