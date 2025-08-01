#!/bin/bash

# Tmux Installation and Configuration Script
# This script installs tmux, applies custom configuration, and starts a detachable session

set -e  # Exit on any error

echo "🚀 Installing and configuring tmux..."

# Update package list and install tmux
echo "📦 Installing tmux via apt..."
sudo apt update
sudo apt install -y tmux

# Create tmux configuration file
echo "⚙️  Creating tmux configuration..."
cat > ~/.tmux.conf << 'EOF'
# Change prefix from C-b to C-a
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# Reload config file
bind r source-file ~/.tmux.conf

# Switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Enable mouse mode
set -g mouse on

# Don't rename windows automatically
set-option -g allow-rename off

# Disable visual notifications
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
setw -g monitor-activity off
set -g bell-action none

# Clock mode
setw -g clock-mode-colour yellow

# Copy mode
setw -g mode-style 'fg=black bg=red bold'

# Panes
set -g pane-border-style 'fg=red'
set -g pane-active-border-style 'fg=yellow'

# Statusbar
set -g status-position bottom
set -g status-justify left
set -g status-style 'fg=red'
set -g status-left ''
set -g status-left-length 10
set -g status-right-style 'fg=black bg=yellow'
set -g status-right '%Y-%m-%d %H:%M '
set -g status-right-length 50

setw -g window-status-current-style 'fg=black bg=red'
setw -g window-status-current-format ' #I #W #F '
setw -g window-status-style 'fg=red bg=black'
setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '
setw -g window-status-bell-style 'fg=yellow bg=red bold'

# Messages
set -g message-style 'fg=yellow bg=red bold'
EOF

echo "✅ Tmux configuration saved to ~/.tmux.conf"

# Check if tmux session already exists
if tmux has-session -t main 2>/dev/null; then
    echo "📺 Tmux session 'main' already exists. Attaching..."
    tmux attach-session -t main
else
    echo "🎬 Starting new detachable tmux session 'main'..."
    tmux new-session -d -s main
    echo "✅ Tmux session 'main' created and running in background"
    echo ""
    echo "💡 To attach to the session, run: tmux attach-session -t main"
    echo "💡 To detach from session: Ctrl+A then D"
    echo "💡 To list sessions: tmux list-sessions"
    echo "💡 To kill session: tmux kill-session -t main"
    echo ""
    echo "🎯 Attaching to session now..."
    tmux attach-session -t main
fi
