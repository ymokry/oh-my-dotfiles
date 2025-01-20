# Install brew packages

# Make sure 'brew' command is available
if ! command -v brew &> /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

say "Installing 'brew' packages"

brew bundle --quiet --file $OMD/brew/.config/brew/Brewfile

say "Brew packages installation is finished"

