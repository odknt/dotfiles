#!/bin/sh

set -euo pipefail
IFS="$(printf '\n\t')"

__usage() {
    cat <<EOS
    usage: init.sh <commands>

    commands:
        install  - Install dependencies.
        gen_unit - Generate unit files.

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

  if [ -z "${GOPATH:-}" ]; then
    GOPATH="${HOME}/go"
  fi

  go get github.com/odknt/go-skkserv-google
  __gen_unit
}

__gen_unit() {
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
  install  ) __install;;
  gen_unit ) __gen_unit;;
  *        ) __usage;;
esac

exit ${?}
