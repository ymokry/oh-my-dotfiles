function _init_fzf() {
    if (( $+commands[fzf] )); then
        eval "$(fzf --zsh)"
    fi
    unfunction _init_fzf
}

_init_fzf
