#!/bin/sh

set -eu

sysresources='/etc/X11/xinit/.Xresources'
userresources="${HOME}/.Xresources"

xrdb -remove

if [ -f "${sysresources}" ]; then
  xrdb -merge "${sysresources}"
fi

if [ -f "${userresources}" ]; then
  xrdb -merge "${userresources}"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    # shellcheck source=/dev/null
    [ -x "${f}" ] && . "${f}"
  done
  unset f
fi

# IME
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# for old applications
fontsdir="${XDG_DATA_HOME:-~/.local/share}/fonts"
if [ -d "${fontsdir}" ]; then
  xset +fp "${fontsdir}"
  xset fp rehash
fi

# WM
if [ -f "${HOME}/.xinitrc-local" ]; then
  # shellcheck source=/dev/null
  . "${HOME}/.xinitrc-local"
fi

if [ -f "${HOME}/.env" ]; then
  # shellcheck source=/dev/null
  . "${HOME}/.env"
fi

# screen locker
xss-lock -- "${XLOCKER:-xsecurelock}" &

# Default Terminal
export TERMINAL="${TERMINAL:-st}"

# Default WM
WM="${1:-bspwm}"
case "${WM}" in
  bspwm)
    export BSPWM_SOCKET="${XDG_RUNTIME_DIR:-/tmp}/bspwm_${DISPLAY}_socket"
  ;;
esac

[ "${0##*/}" != '.xprofile' ] && exec "${WM}"
