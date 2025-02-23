source "${0:a:h}/plugins/plugins.zsh"
source "${0:a:h}/exports/exports.zsh"
source "${0:a:h}/aliases/aliases.zsh"
source "${0:a:h}/autocomplete/autocomplete.zsh"

autoload -Uz compinit; compinit -C
(autoload -Uz compinit; compinit &)