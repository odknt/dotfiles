#!/bin/bash

OUTPUT="$(sensors -Au)"

IFS=$'\n\t'
DATA="$(echo "${OUTPUT}" | egrep -A4 "${CORE}")"
CURRENT="$(echo "${DATA}" | grep -Po "(?<=temp\d_input: )([0-9]+)")"
HIGH="$(echo "${DATA}" | grep -Po "(?<=temp\d_max: )([0-9]+)")"
#CRIT="$(echo "${DATA}" | grep -Po "(?<=temp\d_crit: )([0-9]+)")"

for t in ${CURRENT}; do
  echo -n "${t}℃ ";
  # [[ ${t} -gt ${HIGH} ]] && exit 33
done

exit 0
