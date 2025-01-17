# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Colored completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
