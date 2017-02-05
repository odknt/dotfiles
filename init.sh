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
    yaourt -S --needed "${p}"
  done < .aur.plist

  if [[ -z ${GOPATH:-} ]]; then
    GOPATH="${HOME}/go"
  fi

  go get github.com/odknt/go-skkserv-google
  init::gen_unit
}

init::gen_unit() {
  cat <<EOF> .config/systemd/user/skkserv-google.service
[Unit]
Description=SKK server by using Google IME API

[Service]
ExecStart=${GOPATH}/bin/go-skkserv-google -p 55100 -n 200 /usr/share/skk/SKK-JISYO.L

[Install]
WantedBy=default.target
EOF

  systemctl --user daemon-reload
  systemctl --user enable skkserv-google.service
}

case "$1" in
  install) init::install;;
  gen_unit) init::gen_unit;;
  *)  init::usage;;
esac

exit ${?}
