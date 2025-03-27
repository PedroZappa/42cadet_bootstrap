# Set language
export LANG=en_US.UTF-8

# Set compiler
export CC=clang
export CXX=clang++

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Preferred applications
export EDITOR="nvim"
export PAGER="bat"
export TERMINAL="ghostty"
export BROWSER="chromium"

export HISTFILE=$XDG_CACHE_HOME/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000
export HISTCONTROL=ignorespace

# Clean up ~/ ###
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
