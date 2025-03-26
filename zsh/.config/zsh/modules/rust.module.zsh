function _init_rust {
    local rust_path="$HOME/.local/rust"

    export CARGO_HOME="$rust_path/cargo"
    export RUSTUP_HOME="$rust_path/rustup"

    if [ -d "$CARGO_HOME" ]; then
        source $CARGO_HOME/env
    fi

    unfunction _init_rust
}

_init_rust
