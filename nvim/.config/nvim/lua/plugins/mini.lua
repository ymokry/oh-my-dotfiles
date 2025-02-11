return {
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
