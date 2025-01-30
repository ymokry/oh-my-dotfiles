return {
    -- Collection of various small independent plugins/modules
    {
        'echasnovski/mini.nvim',
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
}

-- vim: ts=4 sts=4 sw=4 et
