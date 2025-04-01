-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup('config_' .. name, { clear = true })
end

-- Load debug command to @l register for JS/TS files
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'js_debug',
  pattern = { 'javascript', 'typescript' },
  callback = function()
    local esc_key = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)

    vim.fn.setreg('l', 'yoconsole.log("' .. esc_key .. 'pa:' .. esc_key .. 'la, ' .. esc_key .. 'pla;' .. esc_key)
  end,
})
