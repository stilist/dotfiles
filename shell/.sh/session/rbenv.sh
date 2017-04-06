#!/usr/bin/env sh

if which rbenv &>/dev/null ; then
  PATH="$PATH:$HOME/.rbenv/bin:$(rbenv prefix)/bin"
  eval "$(rbenv init -)"
fi
