eval "$(fzf --bash)"

source ~/.commonrc

PROMPT_COMMAND='PS1_CMD1=$(~/.config/commonrc/scripts/PS1_git_branch.bash)'; PS1='\n\[\e[92;1m\]\w\[\e[0m\] ${PS1_CMD1}\n\$ '
