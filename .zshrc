autoload -Uz bashcompinit compinit promptinit vcs_info
zstyle ':completion:*' menu select
zstyle ':vcs_info:git:*' check-for-changes  true
zstyle ':vcs_info:git:*' stagedstr          '%F{green}+'
zstyle ':vcs_info:git:*' unstagedstr        '%F{red}*'
zstyle ':vcs_info:*'     formats            ' (%F{green}%b%c%u%f)'
zstyle ':vcs_info:*'     actionformats      '[%b|%a]'
zstyle ':completion:*'   list-colors        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

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
    && ! ${cmd} =~ '(ggr|torify|w3m)'
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

__ps1_desk_name() {
  if [[ -n ${DESK_NAME:-} ]]; then
    echo -n "[%F{cyan}${DESK_NAME}%f] "
  fi
}

__ps1_vim() {
  if [[ -n ${VIMRUNTIME} ]]; then
    echo -n "%F{red}(vim)%f "
  fi
}

export PROMPT='%B%(?..[%?] )%b$(__ps1_vim)$(__ps1_desk_name)%n@%U%m%u${vcs_info_msg_0_}>'

alias ls="ls -F --color"

if [[ -n $DESK_ENV ]]; then
    source "$DESK_ENV"
fi

if [[ -f ~/.zaliases ]]; then
    source ~/.zaliases
fi
