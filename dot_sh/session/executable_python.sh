#!/usr/bin/env sh

if command -v python >/dev/null 2>&1 ; then
  # Handle case that `pyenv` has a `python` shim, but the shim can't resolve
  # a path for `python`.
  if python -c '1' >/dev/null 2>&1 ; then
    # `pip install --user` will put binaries in this path. (`--user` avoids
    # the need to use `sudo`).
    PATH="${PATH}:$(python -c 'import site; print(site.USER_BASE)')/bin"
  fi
fi
