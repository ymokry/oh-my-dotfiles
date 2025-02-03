# Setup xcode-select

if ! xcode-select -p &>/dev/null; then
    say "Installing Xcode Command Line Tools"

    softwareupdate --install-rosetta --agree-to-license

    xcode-select --install

    say "Confirm installation to proceed. The setup will continue automatically once finished"

    until xcode-select -p &>/dev/null; do
        sleep 5
    done

    say "Xcode Command Line Tools installation is finished"
fi
