function _init_cache {
    local zsh_cache="$XDG_CACHE_HOME/zsh"

    # Check 'zsh' cache directory
    if [ ! -d "$zsh_cache" ]; then
        mkdir -p $zsh_cache
    fi

    # Disable .zsh_sessions
    export SHELL_SESSIONS_DISABLE=1

    # Move completions dump to 'zsh' cache
    zstyle ':completion:*' dumpfile "$zsh_cache/.zcompdump"
    # Move completions cache to 'zsh' cache
    zstyle ':completion:*' cache-path "$zsh_cache/.zcompcache"

    unfunction _init_cache
}

_init_cache
