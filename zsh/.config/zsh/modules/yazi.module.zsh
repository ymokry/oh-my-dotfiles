function _init_yazi {
    if command -v yazi &>/dev/null; then
        # Install packages if missing
        if [ ! -d "$XDG_CONFIG_HOME/yazi/plugins" ]; then
            ya pack -i
        fi

        # `yazi` alias to `cd` on exit
        function y() {
            local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
            yazi "$@" --cwd-file="$tmp"

            if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                builtin cd -- "$cwd"
            fi

            rm -f -- "$tmp"
        }
    fi

    unfunction _init_yazi
}

_init_yazi
