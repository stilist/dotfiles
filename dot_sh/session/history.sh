#!/usr/bin/env bash

DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
HISTDIR="${HISTDIR:-${DATA_HOME}/history}"
# Try to create `HISTDIR` if there's nothing at the path. The simple existence
# check is necessary because macOS aliases aren't symlinks, and aren't treated
# as a directory even if they point to a directory. This means the normal `-L`
# (symlink) and `-d` (directory) tests fail.
if [ ! -e "${HISTDIR}" ] ; then
  mkdir -p "${HISTDIR}"
fi
export HISTDIR

# @see https://twitter.com/michaelhoffman/status/639178277786136576
HOSTNAME="$(hostname)"
# Change e.g. `test.local` to `test`.
HOSTNAME_SHORT="${HOSTNAME%%.*}"

if [ -f "${HOME}/.bash_history" ] ; then
  cat "${HOME}/.bash_history" >> "${HISTDIR}/0000-00-00T00.00.00+0000_$(whoami)@${HOSTNAME_SHORT}"
  rm -f "${HOME}/.bash_history"
fi

timestamp_format="%FT%T%z"
HISTTIMEFORMAT="[${timestamp_format}]%_*"
export HISTTIMEFORMAT

# @see https://twitter.com/michaelhoffman/status/639178145673932800
# @note On OS X 10.11 beta, bash wouldn’t save history with the original
#   `%Y/%m/%d` formatting, perhaps because the directory structure didn’t exist.
# @note `$$` appends the PID, to reduce the chance of name collision.
# @note ISO 8601 requires `:` for extended time format, but macOS uses the
#   character as its path separator. `.` is close enough.
timestamp="$(date -u "+${timestamp_format}" | sed s/:/./g)"
HISTFILE="${HISTDIR}/${timestamp}_$(whoami)@${HOSTNAME_SHORT}_$$"
export HISTFILE

# commands entered with leading whitespace are not saved in history
export HISTCONTROL=ignorespace

# don’t truncate history
export HISTFILESIZE=10000000

# Append to history file instead of overwriting.
shopt -s histappend

# Save history as commands are run, rather than when the session is terminated.
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"
