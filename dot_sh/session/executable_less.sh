#!/usr/bin/env sh

# F: quit if the file fits in one screen
# i: ignore case when searching
# R: display ANSI escape sequences (note: this is a security risk)
# X: leave less output in the line buffer after exit
export LESS='-FiRX'
export LESSHISTSIZE=1000000
