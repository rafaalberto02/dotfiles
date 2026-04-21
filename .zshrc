source ~/.config/zsh/completion.zsh
source ~/.config/zsh/keybind.zsh

eval "$(fzf --zsh)"

source ~/.commonrc

setopt PROMPT_SUBST
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt auto_cd

precmd() {
  PS1_CMD1=$(~/.config/commonrc/scripts/PS1_git_branch.bash)
}

PROMPT=$'\n\e[92;1m%~\e[0m ${PS1_CMD1}\n$ '
