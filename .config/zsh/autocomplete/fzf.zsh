if [ $commands[fzf] ]; then
    fzf() {
        unfunction $0

        BASE_PATH="$(brew --prefix fzf)/shell"

        COMPLETION_PATH="${BASE_PATH}/completion.zsh"
        BINDINGS_PATH="${BASE_PATH}/key-bindings.zsh"

        [ -f "${COMPLETION_PATH}" ] && source "${COMPLETION_PATH}"
        [ -f "${BIDINGS_PATH}" ] && source "${BIDINGS_PATH}"

        $0 "$@"
    }

    export FZF_COMPLETION_OPTS='--border --info=inline --multi'
fi

