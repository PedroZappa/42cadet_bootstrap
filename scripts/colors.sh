#!/usr/bin/env bash
# Color Codes
# Run the following command to get list of available colors
# bash -c 'for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done'

# Text attributes
B=$(tput bold)
RESET=$(tput sgr0)
D=$RESET

# Foreground colors
BLA=$(tput setaf 0)     # Black
RED=$(tput setaf 1)     # Red
GRN=$(tput setaf 2)     # Green
YEL=$(tput setaf 3)     # Yellow
BLU=$(tput setaf 4)     # Blue
MAG=$(tput setaf 5)     # Magenta
CYA=$(tput setaf 6)     # Cyan
WHI=$(tput setaf 7)     # White
GRE=$(tput setaf 8)     # Gray
PRP=$(tput setaf 99)    # Purple (256-color range)
BRED=$(tput setaf 9)    # Bright Red
BGRN=$(tput setaf 10)   # Bright Green
BYEL=$(tput setaf 11)   # Bright Yellow
BBLU=$(tput setaf 12)   # Bright Blue
BMAG=$(tput setaf 13)   # Bright Magenta
BCYA=$(tput setaf 14)   # Bright Cyan
BWHI=$(tput setaf 15)   # Bright White

# Background colors
BGBLA=$(tput setab 0)   # Black Background
BGRED=$(tput setab 1)   # Red Background
BGGRN=$(tput setab 2)   # Green Background
BGYEL=$(tput setab 3)   # Yellow Background
BGBLU=$(tput setab 4)   # Blue Background
BGMAG=$(tput setab 5)   # Magenta Background
BGCYA=$(tput setab 6)   # Cyan Background
BGWHI=$(tput setab 7)   # White Background
BGGRE=$(tput setab 8)   # Gray Background
BGPRP=$(tput setab 99)  # Purple Background (256-color range)
BGRED2=$(tput setab 9)  # Bright Red Background
BGGRN2=$(tput setab 10) # Bright Green Background
BGYEL2=$(tput setab 11) # Bright Yellow Background
BGBLU2=$(tput setab 12) # Bright Blue Background
BGMAG2=$(tput setab 13) # Bright Magenta Background
BGCYA2=$(tput setab 14) # Bright Cyan Background
BGWHI2=$(tput setab 15) # Bright White Background

# Bell character (useful for terminal alerts)
BEL=$(tput bel)

