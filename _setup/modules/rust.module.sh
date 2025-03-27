# Setup rust toolchain

if ! command -v rustup &>/dev/null; then
    say "Installing rust"

    OMD_RUST_HOME="$HOME/.local/rust"

    export CARGO_HOME="$OMD_RUST_HOME/cargo"
    export RUSTUP_HOME="$OMD_RUST_HOME/rustup"

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y --no-modify-path

    say "Rust installation is finished"
fi
