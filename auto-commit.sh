#!/bin/bash

# Auto-commit script for Cursor
# This script watches for file changes and automatically commits them

echo "Starting auto-commit watcher..."

# Function to commit changes
commit_changes() {
    echo "Changes detected, committing..."
    git add .
    git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "Changes committed and pushed!"
}

# Watch for changes in the src directory
fswatch -o src/ | while read f; do
    commit_changes
done
