#!/usr/bin/env sh

if which go >/dev/null 2>&1 ; then
  # Ensure $GOPATH is defined.
  #
  # @see https://golang.org/cmd/go/#hdr-GOPATH_environment_variable
  : "${GOPATH:="${HOME}/go"}"
  export GOPATH

  # @see https://github.com/golang/go/wiki/GOPATH#integrating-gopath
  PATH="$PATH:${GOPATH//://bin:}/bin"
fi
