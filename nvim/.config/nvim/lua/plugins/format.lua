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
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_format = 'fallback' }
        end,
        -- Define your formatters
        formatters_by_ft = {
            lua = { 'stylua', stop_after_first = true },
            rust = { 'rustfmt', stop_after_first = true },
            javascript = { 'prettier', stop_after_first = true },
            javascriptreact = { 'prettier', stop_after_first = true },
            typescript = { 'prettier', stop_after_first = true },
            typescriptreact = { 'prettier', stop_after_first = true },
            css = { 'prettier', stop_after_first = true },
            html = { 'prettier', stop_after_first = true },
            json = { 'prettier', stop_after_first = true },
            yaml = { 'prettier', stop_after_first = true },
            markdown = { 'prettier', stop_after_first = true },
            shell = { 'shfmt', stop_after_first = true },
            bash = { 'shfmt', stop_after_first = true },
            go = { 'gofumpt', stop_after_first = true },
        },
    },
}

-- vim: ts=4 sts=4 sw=4 et
