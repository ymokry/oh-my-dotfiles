_setup() {
    SETUP_MODULES="$OMD/_setup/modules"

    say "Setting up fresh macOS installation"

    # Install xcode-select
    source $SETUP_MODULES/xcode.module.sh
    # Initializing git for dotfiles repository
    source $SETUP_MODULES/git.module.sh
}

_setup
unset -f _setup
