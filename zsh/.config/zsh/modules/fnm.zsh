function fnm_init() {
    if (( $+commands[fnm] )); then
        # Expose fnm envs
        eval "$(fnm env --use-on-cd --shell zsh)"

        # Check if completions are initialized
        if ! type _fnm >/dev/null 2>&1; then
            eval "$(fnm completions --shell zsh)"
        fi
    fi
    unfunction fnm_init
}

fnm_init
