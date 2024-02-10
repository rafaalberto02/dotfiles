zstyle '*:compinit' arguments -D -i -u -C -w

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect '\r' .accept-line

zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

zstyle ':autocomplete:*' delay 0.1  # seconds (float)

zstyle ':autocomplete:*' ignored-input '..##'
