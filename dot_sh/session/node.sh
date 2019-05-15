#!/usr/bin/env sh

# Node.js - https://nodejs.org/
PATH="$PATH:$(dirname "$(which node)")"

# Yarn - https://yarnpkg.com
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
