-- [[ Keymaps ]]
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = LazyVim.safe_keymap_set

-- Move highlighted region in Visual mode
map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', 'J', ":m '>+1<CR>gv=gv")

-- Easy navigation through large files
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Keep cursor centered wnen navigatin search results
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Raplace selected region preserving the clipboard
map('x', '<leader>p', '"_dP', { desc = 'Save Paste' })
-- Delete preserving the clipboard content
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Save Delete' })

-- Delete single character without copying into register
map('n', 'x', '"_x')
