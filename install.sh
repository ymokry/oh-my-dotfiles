#!/usr/bin/env sh

echo "Clonning Oh My Dotfiles..."

if ! command -v git >/dev/null 2>&1; then
    echo "Git not found, install to continue."
    exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
    echo "Git not found, install to continue."
    exit 1
fi

OH_MY_DOTFILES_NAME="oh-my-dotfiles"
OH_MY_DOTFILES_REPO="ymokry/$OH_MY_DOTFILES_NAME"
OH_MY_DOTFILES_PATH="$HOME/.$OH_MY_DOTFILES_NAME"

git clone "https://github.com/$OH_MY_DOTFILES_REPO.git" $OH_MY_DOTFILES_PATH

cd $OH_MY_DOTFILES_PATH
git remote remove origin
git remote add origin "git@github.com:$OH_MY_DOTFILES_REPO.git"

source setup.sh
