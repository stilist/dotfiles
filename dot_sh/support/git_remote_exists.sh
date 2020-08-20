#!/usr/bin/env sh

script_pwd="$(dirname "$0")"
. "${script_pwd}/../support/silence.sh"
. "${script_pwd}/../support/git_in_initialized_repo.sh"

###
# `git_remote_exists`
#
# Check if the given remote is in the list of existing remotes.
#
# @return `0` if the remote exists
# @return `1` if the remote does not exist
###
git_remote_exists () {
  git_in_initialized_repo || return 1

  remote=$1
  if [ -z "${remote}" ] ; then
    "Specify a remote" 1>&2
    return 1
  else
    git remote | silence grep "${remote}"
  fi
}
