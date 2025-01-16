#History
HISTFILE="$ZSH_CONFIG/.zsh_history"
# Size
HISTSIZE=10000
SAVEHIST=$HISTSIZE
# Erase duplicates
HISTDUP=erase

# Append commands instead of overriding
setopt appendhistory
# Share commands history across sessions
setopt sharehistory
# Space prefixed commands are ignored
setopt hist_ignore_space
# Save no duplicates
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
# Find no duplicates
setopt hist_find_no_dups
