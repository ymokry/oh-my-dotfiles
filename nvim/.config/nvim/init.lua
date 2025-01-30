-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'config.options'
require 'config.keymaps'
require 'config.autocommands'
require 'config.lazy'

-- vim: ts=4 sts=4 sw=4 et
