#!/usr/bin/env sh

###
# `git_in_repo`
#
# Check if the user is in a directory that's part of a git repository.
#
# @return `0` if in a git repository
# @return `1` if not in a git repository
###
git_in_repo () {
  if git rev-parse --is-inside-work-tree ; then
    return 0
  else
    echo "Not in a git repository" 1>&2
    return 1
  fi
}
