return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {
            enabled = true,
            -- Show notification when big file detected
            notify = true,
            -- 1.5 MB
            size = 1.5 * 1024 * 1024,
        },
        indent = {
            enabled = true,
        },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        scroll = {
            enabled = true,
        },
    },
    keys = {
        {
            '<leader>un',
            function()
                require('snacks').notifier.hide()
            end,
            desc = 'Dismiss all notifications',
        },
    },
}

-- vim: ts=4 sts=4 sw=4 et
