# 
# ************************************************************************** //
#                           zsh Configuration file                           //
# ************************************************************************** //
#
 ###############
 ### General ###
 ###############
 
 # Get colorsful: load color vars
 autoload -U colors && colors
 for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='$fg_no_bold[${(L)COLOR}]'
    eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
 done
 eval NC='$reset_color'

 ##########################
 ### Zap Plugin Manager ###
 ##########################
 
 [ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
 plug "zsh-users/zsh-autosuggestions"
 plug "zap-zsh/supercharge"
 plug "zsh-users/zsh-syntax-highlighting"
 plug "hlissner/zsh-autopair"
 plug "zsh-users/zsh-history-substring-search"
 plug "MichaelAquilina/zsh-you-should-use"
 plug "zap-zsh/completions"
 plug "zap-zsh/sudo"
 plug "web-search"
 plug "zap-zsh/fzf"
 plug "zap-zsh/web-search"
 plug "jeffreytse/zsh-vi-mode"

###############
### Aliases ###
###############

# Compiling
alias ccw='cc -Wall -Wextra -Werror -g'

# Neovim
alias v='nvim'
alias sv='sudo -E nvim'

# git
alias ga='git add'
alias gap='git add -p'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'

 # ##########################
 ### Load Starship Prompt ###
 ############################
 
 if command -v starship > /dev/null 2>&1; then
     eval "$(starship init zsh)"
 else
     ZSH_THEME="refined"
 fi
