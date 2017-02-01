#!/bin/bash

while :; do
  WID=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
  NAME=$(xprop -id $WID | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
  if [[ -n $NAME ]]; then
    echo " $NAME "
  else
    echo
  fi
  perl -e 'use Time::HiRes "sleep"; sleep(0.2);'
done
