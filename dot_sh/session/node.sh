#!/usr/bin/env sh

# Node.js - https://nodejs.org/
if which node >/dev/null 2>&1 ; then
  PATH="${PATH}:$(dirname "$(which node)")"
fi

# Yarn - https://yarnpkg.com
if which yarn >/dev/null 2>&1 ; then
  PATH="${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}"
fi
