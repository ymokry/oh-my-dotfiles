function _init_bun() {
    if (( $+commands[bun] )); then
        # Create if doesn't exist yet
        if [ ! -s "$HOME/.bun/_bun"]; then
            bun completions
        fi

        source $HOME/.bun/_bun
    fi
    unfunction _init_bun
}

_init_bun
