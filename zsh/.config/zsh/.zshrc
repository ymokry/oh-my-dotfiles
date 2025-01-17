# Uncomment to measure performance
# zmodload zsh/zprof

# Referenced by other modules
ZSH_CONFIG="$HOME/.config/zsh"

# Brew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Enable lazy-loading modules
source $ZSH_CONFIG/plugins/zsh-defer/zsh-defer.plugin.zsh

# History
source $ZSH_CONFIG/modules/history.zsh
# Completions
zsh-defer source $ZSH_CONFIG/modules/completions.zsh
# Auto suggestions
zsh-defer source $ZSH_CONFIG/modules/auto-suggestions.zsh
# Syntax highlighting
zsh-defer source $ZSH_CONFIG/modules/syntax-highlighting.zsh
# Suggestions for unknown commands
zsh-defer source $ZSH_CONFIG/modules/cnf.zsh
# Completions for Fast Node Manager
zsh-defer source $ZSH_CONFIG/modules/fnm.zsh

# Styles
source $ZSH_CONFIG/styles.zsh

# Keybindings
source $ZSH_CONFIG/keybindings.zsh

# Aliases
source $ZSH_CONFIG/aliases.zsh

# Uncomment to measure performance
# zprof
