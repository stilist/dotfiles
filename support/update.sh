#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

pushd "$DOTFILES_PATH"
git pull --rebase origin master
ruby ./support/export-files.rb
