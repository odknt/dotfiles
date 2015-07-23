#!/bin/sh

usage() {
    cat <<EOF
    usage: init.sh <commands>

    commands:
        go      - Install favorite packages

EOF
    return 1
}

init_go() {
    if [ -n $GOPATH ]; then
        go get github.com/mattn/gom
    else
        echo 'Must be set GOPATH'
        return 1
    fi
    return 0
}

case "$1" in
    go) init_go;;
    *)  usage;;
esac

exit $?
