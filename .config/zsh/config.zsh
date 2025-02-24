local CURRENT_CONFIG="$HOME/.config/zsh"

source "$CURRENT_CONFIG/autocomplete/autocomplete.zsh"

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump

source "${CURRENT_CONFIG}/plugins/plugins.zsh"
source "${CURRENT_CONFIG}/exports/exports.zsh"
source "${CURRENT_CONFIG}/aliases/aliases.zsh"

unfunction zcompile-many
unset CURRENT_CONFIG
