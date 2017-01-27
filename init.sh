#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

init::usage() {
    cat <<EOS
    usage: init.sh <commands>

    commands:
        install - Install dependencies.

EOS
    return 1
}

init::install() {
  which yaourt &>/dev/null || cat <<'EOS'> /dev/stderr

\e[37;41m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m
\e[37;41m!!!!! Please install yaourt. see https://archlinux.fr/yaourt-en/ !!!!!\e[0m
\e[37;41m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m

EOS
  yaourt -Sy
  yaourt -S --needed --noconfirm - < .native.plist

  while read -r p; do
    yaourt -S --needed "$p"
  done < .aur.plist
}

case "$1" in
  install) init::install;;
  *)  init::usage;;
esac

exit $?
