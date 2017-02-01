#!/bin/bash

OUTPUT="$(sensors -Au)"

IFS=$'\n\t'
DATA="$(echo "${OUTPUT}" | egrep -A4 "${CORE}")"
CURRENT="$(echo "${DATA}" | grep -Po "(?<=temp1_input: )([0-9]+)")"
HIGH="$(echo "${DATA}" | grep -Po "(?<=temp1_max: )([0-9]+)")"
#CRIT="$(echo "${DATA}" | grep -Po "(?<=temp1_crit: )([0-9]+)")"

echo -n "${CURRENT}℃ "
[[ ${t} -gt ${HIGH} ]] && exit 33

exit 0
