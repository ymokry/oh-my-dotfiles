_setup() {
    source $OMD/_utils/shared.sh

    SETUP_MODULES="$OMD/_setup/modules"

    say "Setting up fresh macOS installation"

    # Install xcode-select
    source $SETUP_MODULES/xcode.module.sh
}

_setup
unset -f _setup
