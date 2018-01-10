zmodload zsh/zpty

ZSH_PLUGIN_DIR=/usr/share/zsh/plugins
zplug_load() {
  test -n "${1:-}" \
  && test -f "${ZSH_PLUGIN_DIR}/${1}/${1}.plugin.zsh" \
  && . "${ZSH_PLUGIN_DIR}/${1}/"*.plugin.zsh
}
