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
