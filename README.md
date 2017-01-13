# dotfiles

My desktop environment on Arch Linux.

## GUI

- Ratpoison  
    Current Window Manager. Using [jcs/ratpoison](https://github.com/jcs/ratpoison) instead of official binary.
- [Flat-Plat](https://github.com/nana-4/flat-plat)  
    Current GTK+ theme for apprication using GTK+2 or GTK+3.  
    Google Material design like theme.
- LXAppearance  
    Appearance setting tool for GTK+2 & GTK+3.
- vim
    later then `7.4.1191`

## Install

#### Desktop Environment

```sh
yaourt -S xorg-server xorg-xmodmap xorg-server-utils xorg-xinit xdotool lightdm xinit-xsession flatplat-theme \
    compton dunst imagemagick growl-for-linux uim-xim paluseaudio-alsa alsa-libs alsa-utils gvim git \
    rxvt-unicode-fontspacing-noinc-vteclear-secondarywheel

ln -s ~/.xinitrc-ratpoison ~/.xinitrc

systemctl --user start pulseaudio
systemctl --user enable pulseaudio
```

#### Option

*[go-skkserv-google](https://github.com/uyorum/go-skkserv-google.git)*

```sh
yaourt -S go

GOPATH=~/go go get github.com/uyorum/go-skkserv-google

# Start SKK server
systemctl --user start skkserv-google
systemctl --user enable skkserv-google

uim-pref-gtk
```

*unclutter* - Hide mouse pointer when idling.

```sh
yaourt -S unclutter

systemctl --user start unclutter
systemctl --user enable unclutter
```

##Settings

`$HOME/.env` is autoloading by `.xinitrc-ratpoison`.

```sh
# Create $HOME/.env
vim ~/.env
```

```sh
#!/usr/bin/env bash

# see http://openweathermap.org/appid
export WEATHER_APPID='API_KEY'
```
