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

  if which brew >/dev/null 2>&1 ; then
    if brew --prefix openssl@1.1 >/dev/null 2>&1 ; then
      RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
      export RUBY_CONFIGURE_OPTS
    fi
  fi
fi
