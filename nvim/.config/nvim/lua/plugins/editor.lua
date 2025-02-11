return {
    -- Detect tabstop and shiftwidth automatically
    {
        'tpope/vim-sleuth',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    },
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    {
        'echasnovski/mini.ai',
        version = false,
        event = 'VeryLazy',
        opts = {
            n_lines = 500,
        },
    },
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    {
        'echasnovski/mini.surround',
        version = false,
        event = 'VeryLazy',
        opts = {},
    },
    -- Minimal and fast autopairs
    {
        'echasnovski/mini.pairs',
        version = false,
        event = 'VeryLazy',
        opts = {},
    },
    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
}

-- vim: ts=4 sts=4 sw=4 et
