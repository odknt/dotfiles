typeset -U path
path=(~/bin ~/go/bin ~/.local/bin /opt/bin $path[@])

export HISTFILE=~/.zhistory
export HISTSIZE=1000
export SAVEHIST=100000

export GOPATH=~/go
export EDITOR=vim

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# zip encoding
export ZIPINFOOPT='-OCP932'
export UNZIPOPT='-OCP932'

if [ "$TERM" = "xterm" ]; then
  if [ "$COLORTERM" = "gnome-terminal" ] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
  elif infocmp xterm-256color >/dev/null 2>&1; then
    case "$COLORTERM" in
      gnome-*|xfce4-*|lilyterm) export TERM=xterm-256color;;
    esac
  fi
fi

[[ -f ~/.env ]] && source ~/.env
