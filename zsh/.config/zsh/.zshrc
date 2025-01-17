# Referenced by other modules
ZSH_CONFIG="$HOME/.config/zsh"

# Brew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# History
source $ZSH_CONFIG/modules/history.zsh
# Completions
source $ZSH_CONFIG/modules/completions.zsh
# Syntax highlighting
source $ZSH_CONFIG/modules/syntax-highlighting.zsh
# Suggestions for unknown commands
source $ZSH_CONFIG/modules/cnf.zsh
# Completions for Fast Node Manager
source $ZSH_CONFIG/modules/fnm.zsh

# Aliases
source $ZSH_CONFIG/aliases.zsh
