export PATH="$HOME/.local/bin:$PATH"

if [[ -f "$ZSH_CONFIG/env.secret.zsh" ]]; then
    source $ZSH_CONFIG/env.secret.zsh
fi
