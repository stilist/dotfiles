#!/usr/bin/env sh

HISTORY_PATH="$HOME/.history"
if [ ! -e "$HISTORY_PATH" ] ; then
  mkdir -p "$HISTORY_PATH"
else
  if [ -f "$HISTORY_PATH" ] ; then
    mv "$HISTORY_PATH" "$HOME/history_old"
    mkdir -p "$HISTORY_PATH"
    mv "$HOME/history_old" "$HISTORY_PATH/old_history"
  fi
fi

# @see https://twitter.com/michaelhoffman/status/639178277786136576
HOSTNAME="$(hostname)"
# Change e.g. `test.local` to `test`.
HOSTNAME_SHORT="${HOSTNAME%%.*}"
# @see https://twitter.com/michaelhoffman/status/639178145673932800
# @note On OS X 10.11 beta, bash wouldn’t save history with the original
#   `%Y/%m/%d` formatting, perhaps because the directory structure didn’t exist.
# @note `$$` appends the PID, to reduce the chance of name collision.
# @note ISO 8601 requires `:` for extended time format, but macOS uses the
#   character as its path separator. `.` is close enough.
export HISTFILE="$HISTORY_PATH/$(date -u +%FT%H.%M.%SZ)_${HOSTNAME_SHORT}_$$"

# commands entered with leading whitespace are not saved in history
export HISTCONTROL=ignorespace

# don’t truncate history
export HISTFILESIZE=10000000

# Append to history file instead of overwriting.
#
# @note `shopt` is a Bashism, so make sure it exists as a shell builtin.
which type >/dev/null 2>&1
if [ "$?" -eq "0" ] ; then
  type shopt | grep -q "builtin" && shopt -s histappend
fi

# Save history as commands are run, rather than when the session is terminated.
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
