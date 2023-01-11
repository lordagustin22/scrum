#!/bin/sh

# Get the session name
# echo -n "Enter the name of the session: "
session_name='bg'

# Create the tmux session if it doesn't exist
if [ "$(tmux list-sessions | grep $session_name)" = "" ]; then
  tmux new-session -s $session_name
fi

# Attach to the session
tmux attach-session -t $session_name

# Create the windows
tmux new-window -n 'tremc'
tmux new-window -n 'cointop'
tmux new-window -n 'htop'

# Send the keys to the different windows
tmux send-keys -t $session_name:tremc "tremc" C-m
tmux send-keys -t $session_name:c "cointop" C-m
tmux send-keys -t $session_name:h "htop" C-m
tmux kill-window -tbg:0
