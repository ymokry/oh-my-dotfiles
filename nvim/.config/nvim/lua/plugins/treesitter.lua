return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- Sets main module to use for opts
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = {
            'bash',
            'c',
            'css',
            'diff',
            'editorconfig',
            'git_config',
            'git_rebase',
            'gitcommit',
            'gitignore',
            'go',
            'html',
            'javascript',
            'json',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'python',
            'query',
            'regex',
            'rust',
            'tmux',
            'toml',
            'tsx',
            'typescript',
            'vim',
            'vimdoc',
            'yaml',
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}

-- vim: ts=4 sts=4 sw=4 et
