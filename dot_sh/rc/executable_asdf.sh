#!/usr/bin/bash

# asdf - https://asdf-vm.com
if command -v asdf >/dev/null 2>&1 ; then
  if command -v brew >/dev/null 2>&1 ; then
    . "$(brew --prefix asdf)"/asdf/libexec/asdf.sh
  fi
fi
