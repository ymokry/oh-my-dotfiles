function _init_auto_suggestions {
    if (( $+commands[brew] )); then
        local plugin="$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

        if [ -f "$plugin" ]; then
            source $plugin
        fi
    fi
    unfunction _init_auto_suggestions
}

_init_auto_suggestions
