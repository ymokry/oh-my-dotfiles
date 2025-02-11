-- [[ Options ]]
-- See `:help vim.opt`
-- NOTE: For more options `:help option-list`

-- Show line numbers
vim.wo.number = true
-- Enable relative line numbers
vim.wo.relativenumber = true

-- Enable mouse mode (can be useful for resizing splits)
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim
-- Schedule the setting after "UiEnter" bacause it can increase startup-time
-- See `:help clipboard`
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching
-- NOTE: For case-sensitive search use /C or one or more capital letters
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure new splits opening
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how whitespace characters are displayed
-- See: `:help list` and `:help listchars`
vim.wo.list = true
vim.wo.listchars = 'tab:» ,trail:·,nbsp:␣'

-- Preview substitutions live as you type
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.wo.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10

-- Enable term colors
vim.o.termguicolors = true

-- vim: ts=4 sts=4 sw=4 et
