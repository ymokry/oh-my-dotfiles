#!/usr/bin/env sh

echo "Installing Oh My Dotfiles..."

# Request and keep the administrator password active.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# XCode Command Line Tools: Install if not already present.
echo "Checking for Xcode Command Line Tools..."
if ! xcode-select -p >/dev/null 2>&1; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    read -p "Press [Enter] after installation is finished to continue"
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
export OH_MY_DOTFILES_PATH="$HOME/.$OH_MY_DOTFILES_NAME"

git clone "https://github.com/$OH_MY_DOTFILES_REPO.git" $OH_MY_DOTFILES_PATH

cd $OH_MY_DOTFILES_PATH
git remote remove origin
git remote add origin "git@github.com:$OH_MY_DOTFILES_REPO.git"

source setup.sh
