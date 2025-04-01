function _init_cache {
    export ZDOTDIR="$XDG_CACHE_HOME/zsh"

    # Check 'zsh' cache directory
    if [ ! -d "$ZDOTDIR" ]; then
        mkdir -p $ZDOTDIR
    fi

    # Disable .zsh_sessions
    export SHELL_SESSIONS_DISABLE=1

    # Move completions dump to 'zsh' cache
    zstyle ':completion:*' dumpfile "$ZDOTDIR/.zcompdump"
    # Move completions cache to 'zsh' cache
    zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"

    unfunction _init_cache
}

_init_cache
