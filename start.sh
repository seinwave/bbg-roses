#!/bin/bash

if ! command -v tmux &> /dev/null; then
    echo "Error: tmux is not installed."
    echo "Please install tmux and try again."
    exit 1
fi

echo "Creating new tmux session for backend..."
tmux new-session -d -s BBG_ROSES 'cd api && rails s'

echo "Splitting window for frontend..."
tmux split-window -h 'cd frontend && npm run dev'

echo "Attaching to the tmux session..."
tmux attach -t BBG_ROSES
