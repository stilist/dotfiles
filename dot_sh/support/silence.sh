#!/usr/bin/env sh

###
# `silence`
#
# Send stdout and stderr to `/dev/null`. Useful for scripts that should use a
# command's exit code without logging to the terminal.
#
# @return `0`
#
# @example
#   silence git status
###
silence () {
  "$@" &>/dev/null
}
