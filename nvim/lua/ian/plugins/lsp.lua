-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>fd', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gl', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Completion 
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['pyright'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
}
require('lspconfig')['csharp_ls'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
}
require('lspconfig')['clangd'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require('lspconfig')['bashls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require('lspconfig')['texlab'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
--[[
require('lspconfig')['ltex'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
--]]
require('lspconfig')['html'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  -- Para el root directory
  root_dir = function() return vim.loop.cwd() end,
  -- filetypes = {"html"}
}
require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require('lspconfig')['vimls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require('lspconfig')['cssls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

---------------------------
local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}
-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
----------------------------

-- hover
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
--
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      -- completion ={
      -- border = {'╭', '─', '╮', '│', '╯', '─', '╰', '|'},
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
      { name = 'luasnip' }, -- For luasnip users.
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

vim.cmd[[hi CmpItemMenu guifg=#565f89 gui=italic]]
vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
  --[[
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
  }
  --]]
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
vim.cmd[[hi CmpItemMenu guifg=#565f89 gui=italic]]
vim.cmd[[
hi DiagnosticUnderlineError cterm=undercurl gui=undercurl guisp=#db4b4b
hi DiagnosticUnderlineWarn cterm=undercurl gui=underline,italic guisp=#e0af68
hi DiagnosticUnderlineInfo cterm=undercurl gui=underline,italic guisp=#0db9d7
hi DiagnosticUnderlineHint cterm=undercurl gui=underline,italic guisp=#1abc9c
]]
