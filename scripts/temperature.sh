#!/usr/bin/env bash
OUTPUT=$(sensors -Au)

IFS=$'\n'
DATA=$(echo "${OUTPUT}" | egrep -A4 "${CORE}")
CURRENT=$(echo "${DATA}" | grep -Po "(?<=_input: )([0-9]+)")
HIGH=$(echo "${DATA}" | grep -Po "(?<=_max: )([0-9]+)")
#CRIT=$(echo "${DATA}" | grep -Po "(?<=_crit: )([0-9]+)")

for t in ${CURRENT}; do
  echo "${t}℃ "
done

[[ "${CURRENT}" -gt "${HIGH}" ]] && exit 33
exit 0
