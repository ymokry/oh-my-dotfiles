function _init_zoxide() {
    if (( $+commands[zoxide] )); then
        eval "$(zoxide init --cmd cd zsh)"
    fi
    unfunction _init_zoxide
}

_init_zoxide
