source ~/.config/zsh/completion.zsh

eval "$(fzf --zsh)"

source ~/.commonrc

setopt PROMPT_SUBST

precmd() {
  PS1_CMD1=$(~/.config/commonrc/scripts/PS1_git_branch.bash)
}

PROMPT=$'\n\e[92;1m%~\e[0m ${PS1_CMD1}\n$ '
