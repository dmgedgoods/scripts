#!/bin/bash

# Check if the session exists
tmux has-session -t dev 2>/dev/null

# $? is a special variable that holds the exit status of the last command executed
if [ $? != 0 ]; then
  # Create a new session with the first
  tmux new-session -s dev:1 -d

  # Create the other windows
  tmux new-window -t dev:2 
  tmux new-window -t dev:3 
  tmux new-window -t dev:4 
  
  # Attach to the session
  tmux attach -t dev
else
  echo "Session 'dev' already exists. Attaching..."
  tmux attach -t dev
fi
