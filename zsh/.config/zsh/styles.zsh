# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Colored completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Force zsh not to show completion menu, which allows 
# fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# Preview directory's content with ls when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# Preview directory's content with ls when completing zoxide
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
