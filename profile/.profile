######################################################################
# Environment Variables
######################################################################
export PATH="${HOME}/bin:${HOME}/go/bin:${HOME}/.local/bin:/opt/bin:/usr/lib/ccache/bin:${PATH}"
export EDITOR=vim
export VOLTPATH="${HOME}/.vim/volt"

# golang environment
export GOPATH=~/go

# use ripgrep in fzf
export FZF_DEFAULT_COMMAND='rg --no-ignore-vcs --files --hidden --follow'

# colorized ls
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ssh agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# disable lesshst
export LESSHISTFILE=-

# zip encoding
export ZIPINFOOPT='-OCP932'
export UNZIPOPT='-OCP932'
export RLWRAP_HOME="${HOME}/.cache/rlwrap"

[ "${TERM}" = 'linux' ] && \
export LANG=en_US.utf8

# private environment variables
[ -f "${HOME}/.env" ] && . "${HOME}/.env"
