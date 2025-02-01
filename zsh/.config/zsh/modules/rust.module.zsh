function _init_rust {
    if (( $+commands[rustup] )); then
        # Add `rustup` modules to PATH
        PATH="$HOMEBREW_PREFIX/opt/rustup/bin:$PATH"

        # Make sure `rustup` is initialized
        if ! command -v cargo &> /dev/null; then
            rustup default stable
        fi
    fi

    unfunction _init_rust
}

_init_rust
