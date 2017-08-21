#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    : xmodmap "$usermodmap"
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

# Use Wayland
# export GDK_BACKEND=wayland

# IME
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# Keyboard
setxkbmap -layout us -variant altgr-intl -option ctrl:nocaps
xset r rate 200 30
numlockx on

# Default browser
export BROWSER='firefox'

xrdb -remove
xrdb -merge $HOME/.Xdefaults
if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge $HOME/.Xresources
fi

# WM
xset +fp /usr/share/fonts/TTF
xset fp rehash
if [ -f "$HOME/.xinitrc-local" ]; then
  # shellcheck source=/dev/null
  . "$HOME/.xinitrc-local"
fi

if [ -f "$HOME/.env" ]; then
  # shellcheck source=/dev/null
  . "$HOME/.env"
fi

# Default WM
session=${1:-i3}
case $session in
    i3|i3wm           ) exec i3;;
    ratpoison         ) exec ratpoison;;
    xmonad            ) exec xmonad;;
    # No known session, try to run it as command
    *) exec $1;;
esac
