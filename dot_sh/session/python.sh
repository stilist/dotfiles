#!/usr/bin/env sh

# `pip install --user` will put binaries in this path. (`--user` avoids
# the need to use `sudo`).
if [ -n "$(which python)" ] ; then
  PATH="$PATH:$(python -c 'import site; print(site.USER_BASE)')/bin"
fi
