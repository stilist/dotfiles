#!/usr/bin/env sh

script_pwd="$(dirname "$0")"
. "$script_pwd/../support/silence.sh"
. "$script_pwd/../support/git_in_initialized_repo.sh"
. "$script_pwd/../support/git_remote_exists.sh"

###
# `git_try_remote_branch_checkout`
#
# Attempt to check out the given branch from the given remote.
#
# @return `1` if the branch can't be checked out from the remote
###
git_try_remote_branch_checkout () {
  git_in_initialized_repo || return 1

  remote=$1
  if [ -z "$remote" ] ; then
    "Specify a remote" 1>&2
    return 1
  fi

  branch=$2
  if [ -z "$branch" ] ; then
    "Specify a branch" 1>&2
    return 1
  fi

  if ! git_remote_exists "$remote" ; then
    "Unknown remote" 1>&2
    return 1
  fi

  # Does git know about a branch named `$branch` on `$remote`?
  if silence git show-ref --verify --quiet "refs/remotes/$remote/$branch" ; then
    git checkout -t "$remote/$branch"
  else
    return 1
  fi
}
