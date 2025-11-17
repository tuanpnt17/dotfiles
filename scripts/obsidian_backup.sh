#!/bin/bash
# Navigate to the Obsidian vault
cd ~/vaults/personal || exit

# Add all changes
git add .

# Commit with a timestamp
git commit -m "Automated backup: $(date)"

# Push to the remote repository
git push
