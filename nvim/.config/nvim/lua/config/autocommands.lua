-- [[ Autocommands ]]
-- See `:help lua-guide-autocommands`

local function augroup(name)
    return vim.api.nvim_create_augroup('custom_group_' .. name, { clear = true })
end

-- Highlight when yanking (copying) text
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = augroup('highlight-yank'),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim: ts=4 sts=4 sw=4 et
