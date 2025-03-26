function _init_go {
    # Use custom go PATH
    if command -v go >/dev/null 2>&1; then
        export GOPATH="$HOME/.local/go"
    fi

    unfunction _init_go
}

_init_go
