return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Autoconfigure `lua_ls` and other stuff
        {
            'folke/lazydev.nvim',
            -- NOTE: This plugin loads only for `.lua` filetype
            ft = 'lua',
            opts = {
                library = {
                    -- Load `luvit` types when the `vim.uv` word is found
                    -- NOTE: For more info see: https://github.com/folke/lazydev.nvim?tab=readme-ov-file#-installation
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
        -- Manager for LSP servers, DAP servers, linters, and formatters
        -- NOTE: using `opts = {}` here means this plugin is automatically
        -- `.setup()` once parent plugin is configured
        { 'williamboman/mason.nvim', opts = {} },
        -- Bridge between Mason and LSPconfig
        'williamboman/mason-lspconfig.nvim',
        -- Tool to install and keep all the toold up-to-date
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        -- LSP completions engine
        'saghen/blink.cmp',
    },
    config = function()
        -- Enable the following language servers
        -- NOTE: Add any additional override configuration in the following tables. Available keys are:
        --  cmd (table): Override the default command used to start the server
        --  filetypes (table): Override the default list of associated filetypes for the server
        --  capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  settings (table): Override the default settings passed when initializing the server.
        local servers = {
            ts_ls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },
        }

        -- A list of servers and tools to automatically install if they're not already installed
        local ensure_installed = vim.tbl_keys(servers)
        -- NOTE: Extend with tools that don't require configuration
        vim.list_extend(ensure_installed, {
            'stylua', -- Lua code formatter
        })

        -- Default bridge doesn't support external tools installation
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
            -- `mason-tool-installer` will make sure everything is in place
            ensure_installed = {},
            -- Disable automatic installation to keep the setup clean
            automatic_installation = false,
            -- NOTE: See `:h mason-lspconfig.setup_handlers()`
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    local include_nvim_defaults = true

                    -- Override server capabilities to include completionsa and
                    -- default nvim stuff
                    server.capabilities =
                        require('blink.cmp').get_lsp_capabilities(server.capabilities, include_nvim_defaults)

                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }
    end,
}

-- vim: ts=4 sts=4 sw=4 et
