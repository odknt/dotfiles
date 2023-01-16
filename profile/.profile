if [ "${TERM}" = 'linux' ]; then
  export LANG=en_US.utf8
fi

# XDG directories
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

# root path for golang
export GOPATH=~/go

# append user's PATH to system PATH
export PATH="${HOME}/bin:${GOPATH}/bin:${HOME}/.local/bin:/usr/lib/ccache/bin:${PATH}"

# set editor to vim
export EDITOR=vim
export VISUAL="${EDITOR}"

# colorized ls
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# disable lesshst
export LESSHISTFILE='-'

# volt (vim plugin manager)
export VOLTPATH=~/.vim/volt

# use ripgrep in fzf
export FZF_DEFAULT_COMMAND='rg --no-ignore-vcs --files --hidden --follow'

# ssh agent
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

# set encoding for unzip-iconv
export ZIPINFOOPT=-OCP932
export UNZIPOPT=-OCP932

# set cache directory for rlwrap
export RLWRAP_HOME="${XDG_CACHE_HOME}/rlwrap"

export ANSIBLE_DISPLAY_OK_HOSTS=no
export ANSIBLE_DISPLAY_SKIPPED_HOSTS=no

# private environment variables
if [ -f "${HOME}/.env" ]; then
  . "${HOME}/.env"
fi
