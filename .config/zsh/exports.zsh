export PATH=$HOME/.local/bin:$PATH
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"

autoload -Uz vcs_info

zstyle ':vcs_info:*' disable bzr cdv cvs darcs fossil hg mtn p4 svk svn tla 
zstyle ':vcs_info:*' enable git

PROMPT='
[%~]
%# '

precmd() {
    vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        RPROMPT=""
    else
        RPROMPT="${vcs_info_msg_0_}"
    fi
}

