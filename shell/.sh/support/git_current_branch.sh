#!/usr/bin/env sh

script_pwd="$(dirname "$0")"
. "$script_pwd/../support/git_in_repo.sh"
. "$script_pwd/../support/git_in_initialized_repo.sh"

###
# `git_current_branch`
#
# Get the name of the repository `HEAD`. It may be a branch name, a SHA, or a
# string that indicates the user is not in a useable ref.
#
# @return `1` if the user is not in a repository
# @return [string] if the user is in a repository
###
git_current_branch () {
  git_in_repo &>/dev/null || return 1

  if ! git_in_initialized_repo ; then
    echo "[new repo]"
  else
    git symbolic-ref --quiet --short HEAD 2>/dev/null || \
      git rev-parse --short HEAD 2>/dev/null || \
      echo "[unknown]"
  fi
}
