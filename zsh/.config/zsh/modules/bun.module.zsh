function _init_bun() {
    export BUN_INSTALL="$HOME/.local/bun"
    export PATH="$BUN_INSTALL/bin:$PATH"

    if command -v bun &>/dev/null; then
        local completions="$BUN_INSTALL/_bun"

        # Create if doesn't exist yet
        if [ ! -s "$completions" ]; then
            bun completions >$completions
        fi

        source $completions
    fi

    unfunction _init_bun
}

_init_bun
