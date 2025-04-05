function _init_zoxide() {
    if command -v zoxide &>/dev/null; then
        eval "$(zoxide init --cmd cd zsh)"
    fi
    unfunction _init_zoxide
}

_init_zoxide
