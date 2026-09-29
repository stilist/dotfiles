#!/usr/bin/env sh

# Homebrew's installation path differs by CPU architecture on macOS. This is
# adapted from the Homebrew installation script.
#
# @note On Intel Macs (`x86_64`) Homebrew is installed to `/usr/local/bin`,
#   which is part of the default `$PATH`.
# @see https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
if [[ "$(/usr/bin/uname -m)" == "arm64" ]] ; then
  # Insert at *start* of `$PATH` so Homebrew-managed software takes precedence
  # over system-managed software.
  PATH="/opt/homebrew/bin:${PATH}"
fi
