# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Colored completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Disable sorting for `git checkout` completion
zstyle ':completion:*:git-checkout:*' sort false
# Disable default completion menu, so 'fzf-tab'
# can capture the unambiguous prefix
zstyle ':completion:*' menu no
# Preview directory's content when using cd and zoxide
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --all --tree --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --all --tree --color=always $realpath'
# To make 'fzf-tab' follow $FZF_DEFAULT_OPTS
zstyle ':fzf-tab:*' use-fzf-default-opts yes
