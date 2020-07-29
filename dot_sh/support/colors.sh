#!/usr/bin/env bash

set -euo pipefail

# @see https://github.com/mathiasbynens/dotfiles/blob/13e29f408fc360360b4468aef2c318dff287c7d2/.bash_prompt#L60-L88
if tput setaf 1 &> /dev/null ; then
  tput sgr0 # reset colors
  __COLOR_BOLD=$(tput bold)
  __COLOR_RESET=$(tput sgr0)
  # Solarized colors, taken from http://git.io/solarized-colors.
  __COLOR_BLACK=$(tput setaf 0)
  __COLOR_BLUE=$(tput setaf 33)
  __COLOR_CYAN=$(tput setaf 37)
  __COLOR_GREEN=$(tput setaf 64)
  __COLOR_ORANGE=$(tput setaf 166)
  __COLOR_PURPLE=$(tput setaf 125)
  __COLOR_RED=$(tput setaf 124)
  __COLOR_VIOLET=$(tput setaf 61)
  __COLOR_WHITE=$(tput setaf 15)
  __COLOR_YELLOW=$(tput setaf 136)
else
  __COLOR_BOLD='\e[1m'
  __COLOR_RESET="\e[00m"
  __COLOR_BLACK="\e[130m"
  __COLOR_BLUE="\e[134m"
  __COLOR_CYAN="\e[136m"
  __COLOR_GREEN="\e[132m"
  __COLOR_ORANGE="\e[133m"
  __COLOR_PURPLE="\e[135m"
  __COLOR_RED="\e[131m"
  __COLOR_VIOLET="\e[135m"
  __COLOR_WHITE="\e[137m"
  __COLOR_YELLOW="\e[133m"
fi

export __COLOR_BOLD
export __COLOR_RESET
export __COLOR_BLACK
export __COLOR_BLUE
export __COLOR_CYAN
export __COLOR_GREEN
export __COLOR_ORANGE
export __COLOR_PURPLE
export __COLOR_RED
export __COLOR_VIOLET
export __COLOR_WHITE
export __COLOR_YELLOW
