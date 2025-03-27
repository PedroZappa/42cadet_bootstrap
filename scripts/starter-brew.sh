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

install_package() {
    echo "Installing $pkg..."
    brew install "$pkg"
}

# Loop through the array and install each package
for pkg in "${packages[@]}"; do
    if ! install_package "$pkg"; then
        ((ERRORS++))
    fi
done

brew install --cask font-fira-code-nerd-font

# Final status message
if [ $ERRORS -eq 0 ]; then
    echo "${B}${GRN}󰄬 ${PRP}${USER}${YEL}'s .dotfiles symlinking completed successfully. ${GRN}💻${D}"
else
    echo "${B}${RED}󰄮 ${PRP}${USER}${YEL}'s .dotfiles symlinking completed with $ERRORS errors. ${RED}⚠${D}" >&2
    # exit 1
fi
