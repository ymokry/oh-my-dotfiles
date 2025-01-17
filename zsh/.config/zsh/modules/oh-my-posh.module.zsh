function _init_oh_my_posh {
    if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && (( $+commands[oh-my-posh] )); then
        eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
    fi

    unfunction _init_oh_my_posh
}

_init_oh_my_posh
