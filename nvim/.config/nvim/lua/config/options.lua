-- [[ Options ]]
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Enable break indent
vim.o.breakindent = true

-- Sets how whitespace characters are displayed
-- See: `:help list` and `:help listchars`
vim.wo.list = true
vim.wo.listchars = 'tab:» ,trail:·,nbsp:␣'

-- Preview substitutions live as you type
vim.o.inccommand = 'split'
