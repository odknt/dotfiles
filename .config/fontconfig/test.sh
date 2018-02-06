#!/bin/sh

_check() {
  family="$(fc-match --format '%{family}' "${1}")"
  result="[FAILED]"
  IFS=','
  for f in ${family}; do
    if [ "${f}" = "${2}" ]; then
      result='[OK]'
      break
    fi
  done
  echo "${result} ${1}  =>  ${family}"
}

_check 'Helvetica' 'Helvetica'
_check 'Arial:lang=ja' 'Helvetica'
_check 'Arial:lang=en' 'Helvetica'
_check 'sans-serif:lang=ja' 'Helvetica'
_check 'sans-serif:lang=en' 'Helvetica'
_check 'monospace:lang=ja' 'UmePlus Gothic'
_check 'monospace:lang=en' 'UmePlus Gothic'
