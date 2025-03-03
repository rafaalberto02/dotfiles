local CURRENT_PLUGINS="$HOME/.dotfiles/.config/zsh/plugins"

if [[ ! -e $HOME/.local/bin/fzf ]]; then
    git clone --depth=1 --single-branch https://github.com/junegunn/fzf /tmp/fzf


    (cd /tmp/fzf && \
        make clean install && \
        cp -r bin/ $HOME/.local && \
        cp -r shell/ $HOME/.local)

    zcompile-many $HOME/.local/shell/completion.zsh  
    zcompile-many $HOME/.local/shell/key-bindings.zsh
fi

zsh-defer source $HOME/.local/shell/completion.zsh  
zsh-defer source $HOME/.local/shell/key-bindings.zsh
