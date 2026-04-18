#!/bin/bash

# Paths
TARGET_FILE="$HOME/.bashrc"
SOURCE_FILE="$HOME/dotfiles/bashrc"
BACKUP_DIR="$HOME/.backup"
BACKUP_FILE="$BACKUP_DIR/bashrc"

# 1. Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file $SOURCE_FILE does not exist."
    exit 1
fi

# 2. Check if .bashrc is already a symlink to our source
if [ -L "$TARGET_FILE" ] && [ "$(readlink -f "$TARGET_FILE")" == "$(readlink -f "$SOURCE_FILE")" ]; then
    echo "Symlink already exists and points to the correct location."
    exit 0
fi

# 3. Handle existing .bashrc
if [ -f "$TARGET_FILE" ] || [ -L "$TARGET_FILE" ]; then
    echo "Existing .bashrc found. Backing up to $BACKUP_FILE..."
    
    # Create backup directory if it doesn't exist
    mkdir -p "$BACKUP_DIR"
    
    # Move the existing file to the backup folder
    mv "$TARGET_FILE" "$BACKUP_FILE"
    echo "Backup completed."
fi

# 4. Create the symlink
ln -s "$SOURCE_FILE" "$TARGET_FILE"
echo "Symlink created successfully: $TARGET_FILE -> $SOURCE_FILE"
