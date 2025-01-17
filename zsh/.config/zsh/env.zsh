# Disable .zsh_sessions
export SHELL_SESSIONS_DISABLE=1

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"

if [[ -f "$ZSH_CONFIG/env.secret.zsh" ]]; then
    source $ZSH_CONFIG/env.secret.zsh
fi
