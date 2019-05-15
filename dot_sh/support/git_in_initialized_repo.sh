#!/usr/bin/env sh

script_pwd="$(dirname "$0")"
. "$script_pwd/../support/git_in_repo.sh"
. "$script_pwd/../support/silence.sh"

###
# `git_in_initialized_repo`
#
# Check if the user is in a directory that's part of an initialized git
# repository. (That is, a repository that has at least one branch.)
#
# @return `0` if in an initialized git repository
# @return `1` if not in an initialized git repository
###
git_in_initialized_repo () {
  silence git_in_repo || return 1

  case "$(git status -uno 2>&1)" in
    *"Initial commit"* ) return 1 ;;
    *                  ) return 0 ;;
  esac
}
