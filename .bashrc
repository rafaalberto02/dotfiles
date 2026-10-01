eval "$(fzf --bash)"

source ~/.commonrc

PROMPT_COMMAND='PS1_CMD1=$(PS1_git_branch)';

PS1='\n\[\e[92;1m\]\w\[\e[0m\] ${PS1_CMD1}\n\$ '
