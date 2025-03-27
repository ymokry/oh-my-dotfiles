# Install BUN

if ! command -v bun &>/dev/null; then
    say "Installing bun"

    export BUN_INSTALL="$HOME/.local/bun"

    curl -fsSL https://bun.sh/install | bash

    say "Bun installation is finished"
fi
