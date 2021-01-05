#!/bin/bash

set -euo pipefail

support_path="$(dirname -- "${0}")/../support"

fail_with_usage() {
  local usage
  usage="${1:-}"
  local error
  error="${2:-}"

  # shellcheck source=./support/colors.sh
  . "${support_path}/colors.sh"
  if [ -n "${error}" ] ; then
    echo "${__COLOR_RED}ERROR:${__COLOR_RESET}" \
         "${error}" 1>&2
  fi

  if [[ -n "${usage}" ]] ; then
    echo 1>&2
    echo -e "${usage}" 1>&2
  fi

  exit 1
}
