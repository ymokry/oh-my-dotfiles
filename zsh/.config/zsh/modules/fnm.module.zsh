function _init_fnm() {
    if (( $+commands[fnm] )); then
        # Expose fnm envs
        eval "$(fnm env --use-on-cd --shell zsh)"

        # Check if completions are initialized
        if ! type _fnm >/dev/null 2>&1; then
            eval "$(fnm completions --shell zsh)"
        fi

        # Check `node` installation
        if ! command -v node; then
            local default_node_version=22

            fnm install $default_node_version
        fi
    fi
    unfunction _init_fnm
}

_init_fnm
