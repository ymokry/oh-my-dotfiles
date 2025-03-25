function _init_syntax-highlighting {
    local plugin="$ZSH_CONFIG/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

    if [ -f "$plugin" ]; then
        source $plugin
    fi

    unfunction _init_syntax-highlighting
}

_init_syntax-highlighting
