BASE_PATH="$(brew --prefix fzf)/shell"

COMPLETION_PATH="$BASE_PATH/completion.zsh"
BINDINGS_PATH="$BASE_PATH/key-bindings.zsh"

[ -f "$COMPLETION_PATH" ] && source "$COMPLETION_PATH"
[ -f "$BIDINGS_PATH" ] && source "$BIDINGS_PATH"

export FZF_COMPLETION_OPTS='--border --info=inline --multi'
