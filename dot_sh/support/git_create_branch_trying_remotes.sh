#!/usr/bin/env sh

script_pwd="$(dirname -- "$0")"
# shellcheck source=./../support/silence.sh
. "${script_pwd}/../support/silence.sh"
# shellcheck source=./../support/git_in_initialized_repo.sh
. "${script_pwd}/../support/git_in_initialized_repo.sh"
# shellcheck source=./../support/git_try_remote_branch_checkout.sh
. "${script_pwd}/../support/git_try_remote_branch_checkout.sh"

###
# `git_create_branch_trying_remotes`
#
# Try to check out a tracking branch from a remote ('upstream' or 'origin'),
# or check out a new branch as a fallback.
#
# @return `0` if the branch was created
# @return `1` if unable to create the branch
#
# @example
#   git_create_branch_trying_remotes "feature/add-widget"
###
git_create_branch_trying_remotes () {
  git_in_initialized_repo || return 1

  branch=$1
  if [ -z "${branch}" ] ; then
    "Specify a branch" 1>&2
    return 1
  fi

  # Try to check out a tracking branch from the 'upstream' remote.
  silence git_try_remote_branch_checkout "upstream" "${branch}" && return 0

  # Try to check out a tracking branch from the 'origin' remote.
  silence git_try_remote_branch_checkout "origin" "${branch}" && return 0

  # The branch doesn't seem to exist anywhere, so create it locally.
  git checkout -b "${branch}"
}
