function _init_auto_suggestions {
    local plugin="$ZSH_CONFIG/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

    if [ -f "$plugin" ]; then
        source $plugin
    fi

    unfunction _init_auto_suggestions
}

_init_auto_suggestions
