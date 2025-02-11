return {
    -- Detect tabstop and shiftwidth automatically
    {
        'tpope/vim-sleuth',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    },
    -- Useful plugin to show you pending keybinds.
    {
        'folke/which-key.nvim',
        -- Sets the loading event to 'VimEnter'
        event = 'VimEnter',
        opts = {
            -- Delay between pressing a key and opening which-key (milliseconds)
            -- this setting is independent of vim.opt.timeoutlen
            delay = 0,
            icons = {
                -- Set icon mappings to true if Nerd Font is installed
                mappings = true,
                -- Set to empty table to use defaulf Nerd Font icons
                keys = {},
            },
            -- Document existing key chains
            spec = {
                { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
                { '<leader>d', group = '[D]ocument' },
                { '<leader>r', group = '[R]ename' },
                { '<leader>s', group = '[S]earch' },
                { '<leader>w', group = '[W]orkspace' },
                { '<leader>t', group = '[T]oggle' },
                { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
            },
        },
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
