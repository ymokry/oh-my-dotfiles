function _init_fzf() {
    if (( $+commands[fzf] )); then
        # Apply 'tokyonight_night' color theme
        # https://github.com/folke/tokyonight.nvim/blob/main/extras/fzf/tokyonight_night.sh
        export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
            --preview-window=border-bold
            --layout=reverse
            --info="right"
            --color=fg:#c0caf5
            --color=fg+:#c0caf5
            --color=query:#c0caf5
            --color=bg:#1a1b26
            --color=bg+:#283457
            --color=gutter:#1a1b26
            --color=hl:#2ac3de
            --color=hl+:#2ac3de
            --color=prompt:#2ac3de
            --color=marker:#ff007c
            --color=spinner:#ff007c
            --color=pointer:#ff007c
            --color=info:#545c7e
            --color=border:#27a1b9
            --color=scrollbar:#27a1b9
            --color=separator:#ff9e64
            --color=header:#ff9e64'

        eval "$(fzf --zsh)"
    fi
    unfunction _init_fzf
}

_init_fzf
