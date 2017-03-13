# dotfiles

My desktop environment on Arch Linux.

## GUI

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

## Start X

```sh
xinit <WM | application>

# start secondary X
# startx ~/.xinitrc <WM | application>
```


## Performance settings

#### yaourt

edit below options in `/etc/makepkg.conf`.

```sh
MAKEFLAGS="-j8" # set number of CPU cores at least

COMPRESSGZ=(pigz -c -f -n)
COMPRESSBZ2=(pbzip2 -c -f)
COMPRESSXZ=(xz -T O -c -z -)
```
