if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

source "${HOME}/.config/zsh/config.zsh"
source "/etc/zshrc"

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
