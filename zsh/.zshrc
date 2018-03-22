# completion
autoload -Uz bashcompinit compinit
zstyle ':completion:*' menu select
zstyle ':completion:*'   list-colors        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

bashcompinit
compinit

for zshfile in ~/.zsh/*.zsh; do
  . "${zshfile}"
done

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

if [[ -n $DESK_ENV ]]; then
    source "$DESK_ENV"
fi

if [[ -f ~/.zaliases ]]; then
    source ~/.zaliases
fi
