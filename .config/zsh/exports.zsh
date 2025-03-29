export PATH=$HOME/.local/bin:$PATH
export PATH=$ZSH_CONFIG/scripts:$PATH

export PATH=$PATH:/usr/local/go/bin

export MANPAGER='nvim +Man!'
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
    source $HOME/.nix-profile/etc/profile.d/nix.sh; 
fi 

#export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
#    --highlight-line \
#    --info=inline-right \
#    --ansi \
#    --border=none \
#    --color=bg+:#283457 \
#    --color=bg:#16161e \
#    --color=border:#27a1b9 \
#    --color=fg:#c0caf5 \
#    --color=gutter:#16161e \
#    --color=header:#ff9e64 \
#    --color=hl+:#2ac3de \
#    --color=hl:#2ac3de \
#    --color=info:#545c7e \
#    --color=marker:#ff007c \
#    --color=pointer:#ff007c \
#    --color=prompt:#2ac3de \
#    --color=query:#c0caf5:regular \
#    --color=scrollbar:#27a1b9 \
#    --color=separator:#ff9e64 \
#    --color=spinner:#ff007c \
#    "

PROMPT='
[%~]
%# '

