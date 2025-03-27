#!/usr/bin/env bash

# Exit the script if any command fails
# set -e

# Load Colors
source ./colors.sh

# Array of packages to install
packages=(
    # Essential Lulz
    "lolcat"
    "cowsay"
    "fortune"
    "toilet"
    "boxes"
    "cmatrix"
    # Terminal Tools
    "ghostty"
    "zsh"
    "starship"
    "neovim"
    "tmux"
    "lnav"
    "bat"
    # Git
    "git"
    "lazygit"
    "github-cli"
    # Navigation
    "ripgrep"
    "eza"
    "atuin"
    "zoxide"
    "ranger"
    "fzf"
    # Font
    "ttf-firacode-nerd"
    # C/C++
    "gdb"
    "valgrind"
    # Web
    "nodejs"
    "npm"
    "yarn"
)

# Loop through the array and install each package
for pkg in "${packages[@]}"; do
    echo "Installing $pkg..."
    brew install "$pkg"
done

brew install --cask font-fira-code-nerd-font

echo "All packages installed successfully!"
