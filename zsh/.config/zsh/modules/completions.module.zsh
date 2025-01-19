function _init_completions {
    if (( $+commands[brew] )); then
        local completions="$(brew --prefix)/share/zsh-completions"

        if [ -d "$completions" ]; then
            # Check permissions and fix if needed
            if [[ ! "$(ls -ld $HOMEBREW_PREFIX/share)" =~ ^d(rwx)(r-x)(r-x) ]]; then
                chmod go-w "$HOMEBREW_PREFIX/share"
                chmod -R go-w "$HOMEBREW_PREFIX/share/zsh"
            fi

            FPATH="$completions:$FPATH"
        fi
    fi

    # Load completions
    autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/.zcompdump

    unfunction _init_completions
}

_init_completions
