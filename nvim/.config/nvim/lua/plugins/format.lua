return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format { async = true, lsp_format = 'fallback' }
            end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
        notify_on_error = false,
        -- Set default options
        default_format_opts = {
            lsp_format = 'fallback',
        },
        -- Set up format-on-save
        format_on_save = function(bufnr)
            return {
                timeout_ms = 500,
            }
        end,
        -- Define your formatters
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'isort', 'black' },
            javascript = { 'prettierd', 'prettier', stop_after_first = true },
        },
    },
}

-- vim: ts=4 sts=4 sw=4 et
