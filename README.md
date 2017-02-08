# dotfiles

My desktop environment on Arch Linux.

## GUI

- Ratpoison  
    Previous Window Manager. Using [odknt/ratpoison](https://github.com/odknt/ratpoison) (forked from [jcs/ratpoison](https://github.com/jcs/ratpoison)) instead of official binary.
- i3  
    Current Window Manager. Using [i3-gaps](https://github.com/Airblader/i3) instead of official binary.
- LXAppearance  
    Appearance setting tool for GTK+2 & GTK+3.
- gvim  
    later then `7.4.1191`.
- uim  
    IME for CJK. Among those, I using SKK.
- dmenu2  
    dmenu2 is fork of dmenu. Many useful patches applied and additional options.

## Screenshot

![capture](https://www.tkn.tokyo/capture.png)

## Install

#### Yaourt

execute as `root` user.

```sh
cat <<'EOS'>> /etc/pacman.conf

[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
EOS

pacman -Sy --noconfirm yaourt
```

#### Install dependencies

```sh
./init.sh install
```

## vim

Install and initialize submodules.

```sh
git submodule update --init

pushd ~/.vim/pack/default/start/cpsm
./install.sh
popd
```

## Pulseaudio with ALSA

```sh
systemctl --user start pulseaudio
systemctl --user enable pulseaudio
```

## Local settings

`$HOME/.xinitrc-local` is autoloading by `.xinitrc`.

```sh
# Override i3-sensible-terminal
export TERMINAL=lilyterm
```

## Start X

```sh
xinit <WM | application>

# start secondary X
# startx ~/.xinitrc <WM | application>
```

## Optional settings

*unclutter* - Hide mouse pointer when idling.

```sh
yaourt -S unclutter

systemctl --user start unclutter
systemctl --user enable unclutter
```
