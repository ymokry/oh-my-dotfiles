# Uncomment to measure performance
# zmodload zsh/zprof

# Referenced by other modules
ZSH_CONFIG="$HOME/.config/zsh"

source $ZSH_CONFIG/env.zsh

# Brew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Enable lazy loading
source $ZSH_CONFIG/plugins/zsh-defer/zsh-defer.plugin.zsh

# Base Modules
source $ZSH_CONFIG/modules/history.module.zsh
zsh-defer source $ZSH_CONFIG/modules/completions.module.zsh
zsh-defer source $ZSH_CONFIG/modules/auto-suggestions.module.zsh
zsh-defer source $ZSH_CONFIG/modules/syntax-highlighting.module.zsh

# Plugins
zsh-defer source $ZSH_CONFIG/plugins/fzf-tab/fzf-tab.plugin.zsh

# Shell integrations
zsh-defer source $ZSH_CONFIG/modules/fnm.module.zsh
zsh-defer source $ZSH_CONFIG/modules/cnf.module.zsh
zsh-defer source $ZSH_CONFIG/modules/fzf.module.zsh
zsh-defer source $ZSH_CONFIG/modules/zoxide.module.zsh
zsh-defer source $ZSH_CONFIG/modules/bun.module.zsh

source $ZSH_CONFIG/styles.zsh
source $ZSH_CONFIG/keybindings.zsh
source $ZSH_CONFIG/aliases.zsh

# Uncomment to measure performance
# zprof
