#!/usr/bin/env sh

if command -v gem >/dev/null 2>&1 ; then
  # The paths `gem environment gempath` returns don't include `/bin`, which
  # is where the binaries are -- what matters for `PATH`.
  gempaths="$(gem environment gempath | sed -e "s/:/\/bin:/g")"
  PATH="${PATH}:${gempaths}/bin"
fi
