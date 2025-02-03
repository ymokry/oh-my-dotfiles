function _init_rust {
    if (( $+commands[rustup] )); then
        # Add `rustup` modules to PATH
        PATH="$HOMEBREW_PREFIX/opt/rustup/bin:$PATH"
    fi

    unfunction _init_rust
}

_init_rust
