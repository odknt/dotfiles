#!/bin/sh

sysresources=/etc/X11/xinit/.Xresources
userresources=$HOME/.Xresources

xrdb -remove

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    # shellcheck source=/dev/null
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# XDG
export XDG_CONFIG_HOME=$HOME/.config

# IME
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# for old applications
xset +fp ~/.local/share/fonts
xset fp rehash

# WM
if [ -f "$HOME/.xinitrc-local" ]; then
  # shellcheck source=/dev/null
  . "$HOME/.xinitrc-local"
fi

if [ -f "$HOME/.env" ]; then
  # shellcheck source=/dev/null
  . "$HOME/.env"
fi

# Default Terminal
export TERMINAL="${TERMINAL:-urxvtc}"

xbindkeys

# Default WM
session=${1:-bspwm}
case $session in
  bspwm             ) exec bspwm;;
  i3|i3wm           ) exec i3;;
  ratpoison         ) exec ratpoison;;
  xmonad            ) exec xmonad;;
  # No known session, try to run it as command
  *) exec $1;;
esac
