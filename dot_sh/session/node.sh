#!/usr/bin/env sh

# Node.js - https://nodejs.org/
if command -v node >/dev/null 2>&1 ; then
  PATH="${PATH}:$(dirname -- "$(command -v node)")"
fi

# Yarn - https://yarnpkg.com
if command -v yarn >/dev/null 2>&1 ; then
  PATH="${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}"
fi
