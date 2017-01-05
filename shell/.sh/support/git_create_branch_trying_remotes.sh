#!/usr/bin/env sh

. "$(dirname "$0")/silence.sh"
. "$(dirname "$0")/git_in_initialized_repo.sh"
. "$(dirname "$0")/git_try_remote_branch_checkout.sh"

###
# `git_create_branch_trying_remotes`
#
# Try to check out a tracking branch from a remote ('upstream' or 'origin'),
# or check out a new branch as a fallback.
#
# @return `1` if unable to create the branch
#
# @example
#   git_create_branch_trying_remotes "feature/add-widget"
###
git_create_branch_trying_remotes () {
  silence git_in_initialized_repo || return 1

  branch=$1
  if [ -z "$branch" ] ; then
    "Specify a branch" 1>&2
    return 1
  fi

  # Try to check out a tracking branch from the 'upstream' remote.
  silence git_try_remote_branch_checkout "upstream" "$branch"
  if [ "$?" -eq "1" ] ; then
    # Try to check out a tracking branch from the 'origin' remote.
    silence git_try_remote_branch_checkout "origin" "$branch"
    if [ "$?" -eq "1" ] ; then
      # The branch doesn't seem to exist anywhere, so create it locally.
      git checkout -b "$branch"
    fi
  fi
}
