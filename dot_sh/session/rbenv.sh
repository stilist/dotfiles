#!/usr/bin/env sh

if [ -d "${HOME}/.rbenv" ] ; then
  PATH="${PATH}:${HOME}/.rbenv/bin"
fi

if which rbenv &>/dev/null ; then
  PATH="${PATH}:$(rbenv prefix)/bin"
  eval "$(rbenv init -)"
fi

if [ -d "${HOME}/.rbenv/plugins/ruby-build" ] ; then
  PATH="${PATH}:${HOME}/.rbenv/plugins/ruby-build/bin"
fi
