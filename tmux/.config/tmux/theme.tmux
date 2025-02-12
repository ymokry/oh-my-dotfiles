#!/usr/bin/env sh

# Colors
set -ogq @th_bg "#1A1B26"   # Background
set -ogq @th_fg "#C0CAF5"   # Foreground
set -ogq @th_hl "#283457"   # Highlight
set -ogq @th_og "#FF9E64"   # Orange
set -ogq @th_ca "#27A1B9"   # Cyan

# Sets the style for copy/selection mode
set -g mode-style "bg=#{@th_hl},fg=#{@th_fg}"

# Sets the style for command/message line
set -g message-style "bg=#{@th_hl},fg=#{@th_fg}"
set -g message-command-style "bg=#{@th_hl},fg=#{@th_fg}"

# Status bar configuration
set -g status "on"                                              # Enables the status bar
set -g status-position "top"                                    # Moves status bar to the top
set -g status-justify "left"                                    # Aligns window list to the left
set -g status-style "bg=#{@th_bg},fg=#{@th_fg}"                 # Default status bar colors
set -g status-left "#[default][  #S ] "                        # Left section format
set -g status-left-length "100"                                 # Max length for left section
set -g status-left-style "none,fg=#{@th_ca}"                    # Styles for left section
set -g status-right " #{prefix_highlight}#[default][  #h ]"    # Right section format
set -g status-right-length "100"                                # Max length for right section
set -g status-right-style "none,fg=#{@th_ca}"                   # Styles for right section

# Window bar styling
setw -g window-status-style "none,fg=#{@th_fg}"         # Default window style
setw -g window-status-format "[#I] #W"                  # Default window format
setw -g window-status-current-style "bold,fg=#{@th_og}" # Current window style
setw -g window-status-current-format "[#I] #W"          # Current window format
setw -g window-status-activity-style none               # Clears style for windows with activity
setw -g window-status-bell-style none                   # Clears style for windows with bell
setw -g window-status-last-style none                   # Clears style for the last active window

# Borders configuration
set -g pane-border-status "top"                 # Place the border at the top
set -g pane-border-lines "single"               # This ensures consistent border style
set -g pane-border-format ""                    # Empty format to just create spacing
set -g pane-border-style "fg=#{@th_ca}"         # Inactive pane borders
set -g pane-active-border-style "fg=#{@th_ca}"  # Active pane border

# tmux-prefix-highlight configuration
set -g @prefix_highlight_output_prefix "#[bg=#{@th_bg}]#[fg=#{@th_og}]["    # Hack to override defaults
set -g @prefix_highlight_output_suffix "]"                                  # Set closing bracket
set -g @prefix_highlight_prefix_prompt "◆"                                  # Set prefix symbol
