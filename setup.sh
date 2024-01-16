#!/usr/bin/env sh

echo "Starting Mac setup..."

# Request and keep the administrator password active.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# XCode Command Line Tools: Install if not already present.
echo "Checking for Xcode Command Line Tools..."
if ! xcode-select -p >/dev/null 2>&1; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
else
    echo "Xcode Command Line Tools already installed."
fi

# Homebrew Installation: Install Homebrew if not already installed.
echo "Checking for Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed."
fi

# Update and Upgrade Homebrew: Ensure Homebrew is up-to-date.
echo "Updating and Upgrading Homebrew..."
brew update
brew upgrade

# Core Applications Installation: Install essential applications using Homebrew.
echo "Installing core applications..."
brew bundle install --no-lock

# Clean up.
echo "Running brew cleanup..."
brew cleanup

# Setup shell
echo "Setting up ZSH shell..."
OH_MY_DOTFILES_SHELL="$(brew --prefix)/bin/zsh"
sudo sh -c "echo $OH_MY_DOTFILES_SHELL >> /etc/shells"
chsh -s $OH_MY_DOTFILES_SHELL

echo "Mac setup completed."
read -p "Press [Enter] to exit"
