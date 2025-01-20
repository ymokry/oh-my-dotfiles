# Install brew

if [[ ! -d "/opt/homebrew" ]]; then
    say "Initializing brew"

    # Non-interactive run of the Homebrew installer
    # that doesn’t prompt for passwords
    export NONINTERACTIVE=1

    # Download and execute 'brew' installer
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Make 'brew' available until zsh config is synced
    eval "$(/opt/homebrew/bin/brew shellenv)"

    say "Brew installation is finished"
fi
