#!/usr/bin/env sh

KUBE_CONFIG_DIR="${HOME}/.kube/configs"
if [ -d "${KUBE_CONFIG_DIR}" ] ; then
  KUBE_CONFIGS="$(
    find "${KUBE_CONFIG_DIR}" \
      -type f \
      -print0 \
    | tr "\0" ":" \
    | sed -E "s/:$//"
  )"
  export KUBECONFIG="${HOME}/.kube/config:${KUBE_CONFIGS}"
fi
