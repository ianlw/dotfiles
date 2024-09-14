vim.g.mapleader = ","
local map = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

map("n", ",t", ":Neotree toggle<CR>")
map("n", ",y", ":Telescope fin_files<CR>")
map("n", "<F2>", ":setlocal spell! spelllang=es<CR>")
map("n", "<F3>", ":setlocal spell! spelllang=en<CR>")
map("n", "<F10>", ":split<CR>:ter<CR>:resize 15<CR><Esc>i")
map("n", ",l", ":vertical resize +2<CR>")
map("n", ",h", ":vertical resize -2<CR>")
map("n", ",k", ":resize +2<CR>")
map("n", ",j", ":resize -2<CR>")
map("n", "<C-BACKSPACE>", "vbd")
map("i", "<C-BACKSPACE>", "<Esc>vbdi")
map("n", "<C-Del>", "dw")
map("i", "<C-Del>", "dwi")

map("n", ",c", ":LLPStartPreview<CR>")

-- map("n", "<C-c>", ":TComment<CR>")
-- map("v", "<C-c>", ":TCommentBlock<CR>")
