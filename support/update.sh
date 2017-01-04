#!/usr/bin/env sh

set -euo pipefail
IFS=$'\n\t'

git pull --rebase origin master
ruby ./support/export-files.rb
