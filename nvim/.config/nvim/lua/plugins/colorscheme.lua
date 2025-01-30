return {
    -- Adds global Tokyo night colorscheme
    {
        'folke/tokyonight.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins
        init = function()
            -- Load the colorscheme
            vim.cmd.colorscheme 'tokyonight-night'
        end,
    },
}

-- vim: ts=4 sts=4 sw=4 et
