#!/usr/bin/env ruby

if which rbenv &>/dev/null ; then
  PATH="$PATH:$HOME/.rbenv/bin:$(rbenv prefix)/bin"
  eval "$(rbenv init -)"
fi
