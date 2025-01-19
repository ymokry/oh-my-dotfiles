# Global path references
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# List local executables
export PATH="$HOME/.local/bin:$PATH"

if [[ -f "$ZSH_CONFIG/env.secret.zsh" ]]; then
    source $ZSH_CONFIG/env.secret.zsh
fi
