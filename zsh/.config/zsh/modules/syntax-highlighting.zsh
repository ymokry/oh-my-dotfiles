function _init_syntax-highlighting {
    if (( $+commands[brew] )); then
        local plugin="$(brew --prefix zsh-fast-syntax-highlighting)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

        if [ -f "$plugin" ]; then
            source $plugin
        fi
    fi
    unfunction _init_syntax-highlighting
}

_init_syntax-highlighting
