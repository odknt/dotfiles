# dotfiles

## Support

- cgdb
- editorconfig
- less
- vi
- vim
- emacs
- vncserver
- xmodmap
- xsettingsd

## GUI

- Ratpoison  
    Current Window Manager. Using [jcs/ratpoison](https://github.com/jcs/ratpoison) instead of official binary.
- [Flat-Plat](https://github.com/nana-4/flat-plat)  
    Current GTK+ theme for apprication using GTK+2 or GTK+3.  
    Google Material design like theme.
- lxsession
- LXAppearance  
    Appearance setting tool for GTK+2 & GTK+3.
- vim
    later then `7.4.1191`

#### Arch Linux

```sh
yaourt -S lxsession lxappearance flatplat-theme
```

#### Settings

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
