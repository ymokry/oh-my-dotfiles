# Initialize git for dotfiles

if [ ! -d "$OMD/.git" ]; then
    say "Initializing git for dotfiles repository"

    if [ "$(pwd)" != "$OMD" ]; then
        cd $OMD
    fi

    git init
    git remote add origin https://github.com/ymokry/oh-my-dotfiles.git
    git fetch origin
    git reset --hard origin/main

    say "Dotfiles repository initialization is finished"
fi
