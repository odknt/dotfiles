autoload -Uz bashcompinit compinit promptinit vcs_info
zstyle ':completion:*' menu select
zstyle ':vcs_info:git:*' check-for-changes  true
zstyle ':vcs_info:git:*' stagedstr          '%F{green}+'
zstyle ':vcs_info:git:*' unstagedstr        '%F{red}*'
zstyle ':vcs_info:*'     formats            ' (%F{green}%b%c%u%f)'
zstyle ':vcs_info:*'     actionformats      '[%b|%a]'
zstyle ':completion:*'   list-colors        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# plugin settings
ZSH_PLUGIN_DIR=/usr/share/zsh/plugins
zplug_load() {
  test -n "${1:-}" \
  && test -f "${ZSH_PLUGIN_DIR}/${1}/"*.plugin.zsh \
  && . "${ZSH_PLUGIN_DIR}/${1}/"*.plugin.zsh
}
zplug_load zsh-syntax-highlighting
zplug_load zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# completion
bashcompinit
compinit

# prompt theme
promptinit
prompt walters

setopt nohup
setopt nocheckjobs
setopt PROMPT_SUBST
setopt inc_append_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}
  [[ ${#line} -ge 5
    && ! ${cmd} =~ '(ggr|torify|w3m|jtalk)'
  ]]
}

__git_files() { _files }

if [[ -d /usr/share/fzf ]]; then
  . /usr/share/fzf/completion.zsh
  . /usr/share/fzf/key-bindings.zsh
fi

precmd() {
    vcs_info
}

prompt_desk() {
  if [[ -n ${DESK_NAME:-} ]]; then
    echo -n "[%F{cyan}${DESK_NAME}%f] "
  fi
}

prompt_vim() {
  if [[ -n ${VIMRUNTIME} ]]; then
    echo -n "%F{red}(vim)%f "
  fi
}

PROMPT='%B%(?..[%?] )%b$(prompt_vim)$(prompt_desk)%n@%U%m%u${vcs_info_msg_0_}>'

if [[ -n $DESK_ENV ]]; then
    source "$DESK_ENV"
fi

if [[ -f ~/.zaliases ]]; then
    source ~/.zaliases
fi
