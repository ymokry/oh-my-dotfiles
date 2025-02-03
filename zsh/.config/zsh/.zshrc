# Uncomment to measure performance
# zmodload zsh/zprof

# Source envs on top as they may be
# referenced by other modules
ZSH_CONFIG="$HOME/.config/zsh"
source $ZSH_CONFIG/.zshenv

# Keep on top because other modules
# may rely on brew formulae
source $ZSH_CONFIG/modules/brew.module.zsh

# Set global EDITOR and VISUAL
source $ZSH_CONFIG/modules/editor.module.zsh

# Check 'zsh' cache before other initializations
source $ZSH_CONFIG/modules/cache.module.zsh

# Keep above all the lazy-loaded modules
source $ZSH_CONFIG/plugins/zsh-defer/zsh-defer.plugin.zsh

# Have no idea when to do that
source $ZSH_CONFIG/modules/history.module.zsh

# Apply custom stuff when nothing else
# is left to do before lazy loading
source $ZSH_CONFIG/keybindings.zsh
source $ZSH_CONFIG/aliases.zsh

# Always keep the last
# in the sync load sequence
source $ZSH_CONFIG/modules/oh-my-posh.module.zsh

# Lazy modules start here
# 'compinit' has the highest priority
zsh-defer source $ZSH_CONFIG/modules/completions.module.zsh

# As per docs 'fzf' should be loaded
# after completions and before styling
zsh-defer source $ZSH_CONFIG/modules/fzf.module.zsh
zsh-defer source $ZSH_CONFIG/plugins/fzf-tab/fzf-tab.plugin.zsh

# Shell integrations and initializations,
# there's no particular order
zsh-defer source $ZSH_CONFIG/modules/cnf.module.zsh
zsh-defer source $ZSH_CONFIG/modules/fnm.module.zsh
zsh-defer source $ZSH_CONFIG/modules/zoxide.module.zsh
zsh-defer source $ZSH_CONFIG/modules/bun.module.zsh
zsh-defer source $ZSH_CONFIG/modules/bat.module.zsh
zsh-defer source $ZSH_CONFIG/modules/yazi.module.zsh
zsh-defer source $ZSH_CONFIG/modules/rust.module.zsh
zsh-defer source $ZSH_CONFIG/modules/go.module.zsh

# Do suggestions and syntax highlighting
# when there's nothing else to be done
zsh-defer source $ZSH_CONFIG/modules/auto-suggestions.module.zsh
zsh-defer source $ZSH_CONFIG/modules/syntax-highlighting.module.zsh

# Uncomment to measure performance
# zprof
