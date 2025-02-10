return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'CmdlineEnter' },
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
            eslint = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },
            jsonls = {},
            yamlls = {},
            rust_analyzer = {},
            bashls = {},
            gopls = {},
            html = {},
            cssls = {},
            emmet_language_server = {},
        }

        -- A list of servers and tools to automatically install if they're not already installed
        local ensure_installed = vim.tbl_keys(servers)
        -- NOTE: Extend with tools that don't require configuration
        vim.list_extend(ensure_installed, {
            'stylua', -- Lua code formatter
            'shfmt', -- Shell, Bash formatter
            'gofumpt', -- Go formatter
            'prettier', -- JS, TS code formatter
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

        --  This function gets run when an LSP attaches to a particular buffer.
        --    That is to say, every time a new file is opened that is associated with
        --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --    function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('custom_group_lsp_attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end
                local builtin = require 'telescope.builtin'

                -- Jump to the definition of the word under your cursor.
                --  This is where a variable was first declared, or where a function is defined, etc.
                --  To jump back, press <C-t>.
                map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')

                -- Find references for the word under your cursor.
                map('gr', builtin.lsp_references, '[G]oto [R]eferences')

                -- Jump to the implementation of the word under your cursor.
                --  Useful when your language has ways of declaring types without an actual implementation.
                map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                -- Jump to the type of the word under your cursor.
                --  Useful when you're not sure what type a variable is and you want to see
                --  the definition of its *type*, not where it was *defined*.
                map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')

                -- Fuzzy find all the symbols in your current document.
                --  Symbols are things like variables, functions, types, etc.
                map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')

                -- Fuzzy find all the symbols in your current workspace.
                --  Similar to document symbols, except searches over your entire project.
                map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                -- Rename the variable under your cursor.
                --  Most Language Servers support renaming across files, etc.
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_augroup =
                        vim.api.nvim_create_augroup('custom_group_lsp_highlight', { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup('custom_group_lsp_detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = 'custom_group_lsp_highlight', buffer = event2.buf }
                        end,
                    })
                end
            end,
        })
    end,
}

-- vim: ts=4 sts=4 sw=4 et
