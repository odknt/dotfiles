#!/bin/sh

set -euo pipefail
IFS="$(printf '\n\t')"

__usage() {
    cat <<EOS
    usage: init.sh <commands>

    commands:
        install  - Install dependencies.

EOS
    return 1
}

__install() {
  which yaourt &>/dev/null || cat <<'EOS'> /dev/stderr

\e[37;41m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m
\e[37;41m!!!!! Please install yaourt. see https://archlinux.fr/yaourt-en/ !!!!!\e[0m
\e[37;41m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m

EOS
  yaourt -Sy
  yaourt -S --needed --noconfirm .native.plist
  yaourt -S --needed --noconfirm .aur.plist
}

case "$1" in
  install  ) __install;;
  *        ) __usage;;
esac

exit ${?}
