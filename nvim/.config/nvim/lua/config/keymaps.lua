-- [[ Keymaps ]]
-- See: `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
-- See: `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics [Q]uickfix list' })

-- Move highlighted region in Visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Easy navigation through large files
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor centered wnen navigatin search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Raplace selected region preserving the clipboard
vim.keymap.set('x', '<leader>p', '"_dP')

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

-- Delete preserving the clipboard content
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

-- Disable arrow keys navigation
vim.keymap.set('n', '<left>', "<cmd>echo 'Use h to move!'<CR>")
vim.keymap.set('n', '<down>', "<cmd>echo 'Use j to move!'<CR>")
vim.keymap.set('n', '<up>', "<cmd>echo 'Use k to move!'<CR>")
vim.keymap.set('n', '<right>', "<cmd>echo 'Use l to move!'<CR>")

-- Keybinds to make split navigation easier
-- See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the top window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', { silent = true })

-- vim: ts=4 sts=4 sw=4 et
