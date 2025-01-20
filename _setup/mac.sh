_setup() {
    SETUP_MODULES="$OMD/_setup/modules"

    say "Setting up fresh macOS installation"

    # Install 'xcode-select'
    source $SETUP_MODULES/xcode.module.sh
    # Initializing git for dotfiles repository
    source $SETUP_MODULES/git.module.sh
    # Install 'brew'
    source $SETUP_MODULES/brew.module.sh
    # Sync and install 'brew' dependencies
    source $SETUP_MODULES/brew-packages.module.sh


    # TODO: Configure os defaults

    say "MacOS setup is finished"
}

_setup
unset -f _setup
