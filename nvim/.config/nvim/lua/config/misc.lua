-- Make zsh files recognized as sh for bash-ls & treesitter
vim.filetype.add {
    extension = {
        zsh = 'sh',
        -- Force sh-files with zsh-shebang to still get sh as filetype
        sh = 'sh',
    },
    filename = {
        ['.zshrc'] = 'sh',
        ['.zshenv'] = 'sh',
        ['.secret.zshenv'] = 'sh',
    },
}
