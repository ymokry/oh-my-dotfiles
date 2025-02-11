return {
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
    -- Statusline
    {
        'echasnovski/mini.statusline',
        version = false,
        event = 'VimEnter',
        config = function()
            -- Simple and easy statusline.
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = true }

            -- Override location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return '%2l:%-2v'
            end
        end,
    },
    -- File explorer
    {
        'echasnovski/mini.files',
        version = false,
        event = 'VeryLazy',
        opts = {
            windows = {
                -- Maximum number of windows to show side by side
                max_number = 5,
                -- Whether to show preview of file/directory under cursor
                preview = true,
                -- Width of focused window
                width_focus = 25,
                -- Width of non-focused window
                width_nofocus = 20,
                -- Width of preview window
                width_preview = 50,
            },
        },
        config = function()
            local files = require 'mini.files'
            vim.keymap.set('n', '<leader>e', files.open, { desc = 'Open File [E]xplorer' })
        end,
    },
}

-- vim: ts=4 sts=4 sw=4 et
