_setup() {
    SETUP_MODULES="$OMD/_setup/modules"

    say "Setting up fresh RPi installation"

    # Check $HOME directories
    source $SETUP_MODULES/home.module.sh
    # Initializing git for dotfiles repository
    source $SETUP_MODULES/git.module.sh
    # Install 'rust'
    source $SETUP_MODULES/rust.module.sh

    say "RPi setup is finished"
}

_setup
unset -f _setup
