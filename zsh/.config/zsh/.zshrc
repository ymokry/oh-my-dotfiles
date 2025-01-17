# Uncomment to measure performance
# zmodload zsh/zprof

# Referenced by other modules
ZSH_CONFIG="$HOME/.config/zsh"

# Brew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Plugins
source $ZSH_CONFIG/plugins/zsh-defer/zsh-defer.plugin.zsh

# Modules
source $ZSH_CONFIG/modules/history.module.zsh
zsh-defer source $ZSH_CONFIG/modules/completions.module.zsh
zsh-defer source $ZSH_CONFIG/modules/auto-suggestions.module.zsh
zsh-defer source $ZSH_CONFIG/modules/syntax-highlighting.module.zsh
zsh-defer source $ZSH_CONFIG/modules/command-not-found.module.zsh
zsh-defer source $ZSH_CONFIG/modules/fast-node-manager.module.zsh

# Styles
source $ZSH_CONFIG/styles.zsh
source $ZSH_CONFIG/keybindings.zsh
source $ZSH_CONFIG/aliases.zsh

# Uncomment to measure performance
# zprof
