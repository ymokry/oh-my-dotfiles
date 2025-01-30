function _init_editor {
    # Set Neovim as a default editor
    export EDITOR="$(which nvim)"
    export VISUAL="$EDITOR"

    # Force emacs bindings for tmux
    if [[ -n $TMUX ]]; then
        bindkey -e
    fi

    unfunction _init_editor
}

_init_editor
