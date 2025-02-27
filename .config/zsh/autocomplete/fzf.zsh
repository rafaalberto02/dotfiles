local FZF_REPOS="$HOME/.config/zsh/autocomplete/repositories/fzf"

[ ! -d $FZF_REPOS ] && mkdir -p $REPOS

local COMPLETION="$FZF_REPOS/completion.zsh"

if [[ ! -f $COMPLETION ]]; then
    echo "Downloading $COMPLETION..."

    wget --quiet -P $FZF_REPOS https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/shell/completion.zsh

    autoload -U zrecompile

    zrecompile -pq $COMPLETION
fi

local KEY_BINDINGS="$FZF_REPOS/key-bindings.zsh"

if [[ ! -f $KEY_BINDINGS ]]; then
    echo "Downloading $KEY_BINDINGS..."

    wget --quiet -P $FZF_REPOS https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/shell/key-bindings.zsh

    autoload -U zrecompile

    zrecompile -pq $KEY_BINDINGS
fi

compdef _gnu_generic fzf

export FZF_COMPLETION_OPTS='--border --info=inline --multi'

source $COMPLETION
source $KEY_BINDINGS

unset COMPLETION
unset KEY_BINDINGS
unset FZF_REPOS

