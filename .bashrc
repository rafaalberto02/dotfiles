#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -hall'

alias grep='grep --color=auto'

alias pacman='sudo pacman'
PS1='[\u@\h \W]\$ '

export MANPAGER="nvim +Man!"

eval "$(fzf --bash)"

shopt -s autocd

source ~/.config/bash/scripts/ansi_colors.bash

PROMPT_COMMAND='PS1_CMD1=$(~/.config/bash/scripts/PS1_git_branch.bash)'; PS1='\n\[\e[92;1m\]\w\[\e[0m\] ${PS1_CMD1}\n\$ '
