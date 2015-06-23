#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Kill CapsLock key
xmodmap ~/.Xmodmap

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

export EDITOR=vim

# Golang environment
export GOPATH="$HOME/go"
export GOROOT=/usr/lib64/go
export PATH=$PATH:/opt/bin:$GOPATH/bin:$GOROOT/bin
