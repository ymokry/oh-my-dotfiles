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
    read -p "Press [Enter] after installation is finished"
else
    echo "Xcode Command Line Tools already installed."
fi

if ! git -v >/dev/null 2>&1; then
    echo "Wait for the Xcode-select install to finish before continuing."
    exit 1
fi

# Check Curl instalation
echo "Checking for Curl..."
if ! command -v curl >/dev/null 2>&1; then
    echo "Curl not found, install to continue."
    exit 1
else
    echo "Curl already installed."
fi

# Cloning Oh My Dotfiles
echo "Cloning Oh My Dotfiles repository..."
OH_MY_DOTFILES_NAME="oh-my-dotfiles"
OH_MY_DOTFILES_REPO="ymokry/$OH_MY_DOTFILES_NAME"
OH_MY_DOTFILES_PATH="$HOME/.$OH_MY_DOTFILES_NAME"

git clone "https://github.com/$OH_MY_DOTFILES_REPO.git" $OH_MY_DOTFILES_PATH

cd $OH_MY_DOTFILES_PATH
git remote remove origin
git remote add origin "git@github.com:$OH_MY_DOTFILES_REPO.git"

# Homebrew Installation: Install Homebrew if not already installed.
echo "Checking for Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed."
fi

# Update and Upgrade Homebrew: Ensure Homebrew is up-to-date.
echo "Updating and Upgrading Homebrew..."
brew update
brew upgrade

# Setup ZSH shell
echo "Setting up ZSH shell..."
brew install zsh
OH_MY_DOTFILES_SHELL="$(brew --prefix)/bin/zsh"
sudo sh -c "echo $OH_MY_DOTFILES_SHELL >> /etc/shells"
chsh -s $OH_MY_DOTFILES_SHELL

# Install Oh My ZSH
echo "Setting up Oh My ZSH..."
RUNZSH=no /bin/sh -c "$(curl -fsSL http://install.ohmyz.sh)"

# Core Applications Installation: Install essential applications using Homebrew.
echo "Installing core applications..."
brew bundle install --no-lock

# Clean up.
echo "Running brew cleanup..."
brew cleanup

# Linking dotfiles
echo "Setting up SSH..."
OH_MY_DOTFILES_SSH="~/.ssh"
mkdir -p $OH_MY_DOTFILES_SSH
ln -s $OH_MY_DOTFILES_PATH/config/ssh/config $OH_MY_DOTFILES_SSH/config

echo "Mac setup completed."
read -p "Press [Enter] to exit"
