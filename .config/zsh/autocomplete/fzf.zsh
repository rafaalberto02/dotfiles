local REPOS="${0:a:h}/repositories/fzf"

[ ! -d $REPOS ] && mkdir -p $REPOS

local COMPLETION="$REPOS/completion.zsh"

if [[ ! -f $COMPLETION ]]; then
    echo "Downloading $COMPLETION..."

    wget --quiet -P $REPOS https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/shell/completion.zsh

    autoload -U zrecompile

    zrecompile -pq $COMPLETION
fi

local KEY_BINDINGS="$REPOS/key-bindings.zsh"

if [[ ! -f $KEY_BINDINGS ]]; then
    echo "Downloading $KEY_BINDINGS..."

    wget --quiet -P $REPOS https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/shell/key-bindings.zsh

    autoload -U zrecompile

    zrecompile -pq $KEY_BINDINGS
fi

fpath+=$REPOS

. $COMPLETION
. $KEY_BINDINGS

export FZF_COMPLETION_OPTS='--border --info=inline --multi'
