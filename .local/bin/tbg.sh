#!/bin/sh

# Get the session name
# echo -n "Enter the name of the session: "
session_name='bg'

# Create the tmux session if it doesn't exist
if [ "$(tmux list-sessions | grep $session_name)" != 'bg' ]; then
  tmux new-session -s $session_name
fi

# Create the windows
tmux new-window -t $session_name -n 'tremc'
tmux new-window -t $session_name -n 'cointop'
tmux new-window -t $session_name -n 'htop'

# Send the keys to the different windows
tmux send-keys -t $session_name:tremc "tremc" C-m
tmux send-keys -t $session_name:c "cointop" C-m
tmux send-keys -t $session_name:h "htop" C-m
tmux kill-window -t $session_name:0

# Not used
# tmux kill-window -t $session_name:4
# tmux kill-window -t $session_name:5
# tmux kill-window -t $session_name:6
