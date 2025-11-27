export PATH=$HOME/.local/bin:$PATH
export PATH=$ZSH_CONFIG/scripts:$PATH

export PATH=$PATH:/usr/local/go/bin

export MANPAGER="col -b | vim -R -c 'set ft=man nomod' -"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
export UNCRUSTIFY_CONFIG=$HOME/.config/.uncrustify.cfg
    source $HOME/.nix-profile/etc/profile.d/nix.sh; 
fi 

PROMPT='
[%~]
%# '

