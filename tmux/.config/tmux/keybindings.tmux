#!/usr/bin/env sh

# Reload config
bind R source-file ~/.config/tmux/tmux.conf

# Move around panes
unbind Left
bind h select-pane -L
unbind Down
bind j select-pane -D
unbind Up
bind k select-pane -U
unbind Right
bind l select-pane -R

# Split horizontally in CWD
unbind %
bind \\ split-window -h -c "#{pane_current_path}"

# Split vertically in CWD
unbind \"
bind - split-window -v -c "#{pane_current_path}"

# New window in CWD
bind c new-window -c "#{pane_current_path}"

# Vi-style text selection
bind -T copy-mode-vi v send-keys -X begin-selection
