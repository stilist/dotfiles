#!/usr/bin/env bash

set -euo pipefail

script_pwd="$(dirname -- "${0}")"
# shellcheck source=./../support/colors.sh
. "${script_pwd}/../support/colors.sh"

fail_with_usage() {
  local usage
  usage="${1:-}"
  local error
  error="${2:-}"

  if [ -n "${error}" ] ; then
    echo "${__COLOR_RED}ERROR:${__COLOR_RESET}" \
         "${error}" 1>&2
    echo 1>&2
  fi

  echo -e "${usage}" 1>&2
  exit 1
}
