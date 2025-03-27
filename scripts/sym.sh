#!/usr/bin/env bash
#!/bin/bash

# Load Colors
source ./colors.sh

# Check bash version for associative array support
if [ "${BASH_VERSINFO:-0}" -lt 4 ]; then
    echo "Error: This script requires bash version 4.0 or higher." >&2
    exit 1
fi

# Enable error handling
# set -euo pipefail

# Get $USER home directory
if [ -n "$SUDO_USER" ]; then
    HOME=$(eval echo ~$SUDO_USER)
else
    HOME=$HOME
fi

# Associative array defining source and target FILES
declare -A FILES=(
    ["$HOME/.dotfiles/ghostty"]="$HOME/.config/ghostty"
    ["$HOME/.dotfiles/.zshrc"]="$HOME/.zshrc"
    ["$HOME/.dotfiles/.zshenv"]="$HOME/.zshenv"
    ["$HOME/.dotfiles/.gitconfig"]="$HOME/.gitconfig"
    ["$HOME/.dotfiles/starship.toml"]="$HOME/.config/starship.toml"
    ["$HOME/.dotfiles/.gdbinit"]="$HOME/.gdbinit"
    ["$HOME/.dotfiles/.editorconfig"]="$HOME/.editorconfig"
    ["$HOME/.dotfiles/.vimrc"]="$HOME/.vimrc"
    ["$HOME/.dotfiles/nvim"]="$HOME/.config/nvim"
    ["$HOME/.dotfiles/.tmux.conf"]="$HOME/.tmux.conf"
    ["$HOME/.dotfiles/bat/"]="$HOME/.config/bat"
)

# Define the backup directory with timestamp
BACKUP_DIR="$HOME/.dotfiles_bak/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Create symlinks to .dotfiles
create_symlink() {
    local SRC="$1"
    local DEST="$2"

    # Check if source exists
    if [ ! -e "$SRC" ]; then
        echo "${RED}Error: Source $SRC does not exist${D}" >&2
        return 1
    fi

    # Backup existing destination if it exists
    if [ -e "$DEST" ] || [ -L "$DEST" ]; then
        local BASENAME=$(basename "$DEST")
        mv "$DEST" "$BACKUP_DIR/${BASENAME}_bak"
        echo "${YEL}Moved existing ${PRP}$DEST ${YEL}to ${PRP}$BACKUP_DIR/${BASENAME}_bak${D}"
    fi

    # Create the symlink
    ln -s "$SRC" "$DEST"
    echo "${YEL}Created symlink from ${GRN}$SRC ${YEL}to ${PRP}$DEST${D}"
}

# Create symlinks with error tracking
ERRORS=0
for SRC in "${!FILES[@]}"; do
    DEST=${FILES[$SRC]}
    if ! create_symlink "$SRC" "$DEST"; then
        ((ERRORS++))
    fi
done

# Final status message
if [ $ERRORS -eq 0 ]; then
    echo "${B}${GRN}󰄬 ${PRP}${USER}${YEL}'s .dotfiles symlinking completed successfully. ${GRN}💻${D}"
else
    echo "${B}${RED}󰄮 ${PRP}${USER}${YEL}'s .dotfiles symlinking completed with $ERRORS errors. ${RED}⚠${D}" >&2
    # exit 1
fi

