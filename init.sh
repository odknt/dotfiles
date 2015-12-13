#!/bin/bash

init::usage() {
    cat <<EOF
    usage: init.sh <commands>

    commands:
        go      - Install favorite packages.
        neovim  - Create symbolic link from vim config files.

EOF
    return 1
}

init::go() {
    if [ -n "$GOPATH" ]; then
        go get github.com/mattn/gom
    else
        echo 'Must be set GOPATH.'
        return 1
    fi
}

init::neovim() {
    local neovim_config_home

    if [ -z "$XDG_CONFIG_HOME" ]; then
        neovim_config_home="$HOME/.config/nvim"
    else
        neovim_config_home="$XDG_CONFIG_HOME/nvim"
    fi

    : Create Neovim config directory.
    mkdir -p "$neovim_config_home"

    : Create symbolic links.
    readonly neovim_rc="$neovim_config_home/init.vim"
    if [ -f "$neovim_rc" ] && [ -L "$neovim_rc" ]; then
        echo 'init.vim already exists.'
        return 1
    fi
    ln -s "$HOME/.vim/vimrc" "$neovim_rc"

    readonly neovim_frags="$neovim_config_home/frags"
    if [ -d "$neovim_frags" ] && [ -L "$neovim_frags" ]; then
        echo 'frags already exists.'
        return 1
    fi

    : Install plugins
    nvim -c PlugInstall -c :qa --headless

    (cd "$neovim_config_home/plugged/cpsm" ; bash install.sh)
}

case "$1" in
    go) init::go;;
    neovim) init::neovim;;
    *)  init::usage;;
esac

exit $?
