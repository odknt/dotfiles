autoload -U vcs_info
zstyle ':vcs_info:git:*' check-for-changes  true
zstyle ':vcs_info:git:*' stagedstr          '%F{green}+'
zstyle ':vcs_info:git:*' unstagedstr        '%F{red}*'
zstyle ':vcs_info:*'     formats            ' (%F{green}%b%c%u%f)'
zstyle ':vcs_info:*'     actionformats      '[%b|%a]'

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
RPROMPT='%F{green}%~%f'
