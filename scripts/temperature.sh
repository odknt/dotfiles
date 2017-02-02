#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

OUTPUT="$(sensors -Au)"

DATA="$(echo "${OUTPUT}")"
CURRENT="$(echo "${DATA}" | grep -Po "(?<=temp1_input: )([0-9]+)" | head -n1)"
HIGH="$(echo "${DATA}" | grep -Po "(?<=temp1_max: )([0-9]+)" | head -n1)"
#CRIT="$(echo "${DATA}" | grep -Po "(?<=temp1_crit: )([0-9]+)")"

echo "${CURRENT}℃ "
[[ ${CURRENT} > ${HIGH} ]] && exit 33

exit 0
