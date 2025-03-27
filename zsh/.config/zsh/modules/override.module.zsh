function _init_override() {
    local override="$ZSH_CONFIG/override.zsh"

    if [[ -f $override ]]; then
        source $override
    fi

    unfunction _init_override
}

_init_override
