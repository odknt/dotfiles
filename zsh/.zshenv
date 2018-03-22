HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=100000

GOPATH=~/go
EDITOR=vim

LSCOLORS=exfxcxdxbxegedabagacad
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

FZF_DEFAULT_COMMAND='rg --no-ignore-vcs --files --hidden --follow'

# zip encoding
ZIPINFOOPT='-OCP932'
UNZIPOPT='-OCP932'

[[ -f ~/.env ]] && . ~/.env
