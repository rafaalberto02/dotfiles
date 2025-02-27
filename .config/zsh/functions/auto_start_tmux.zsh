if [[ ! -n $TMUX  ]]; then
    session_ids="$(tmux list-sessions)"

    if [[ -z "$session_ids" ]]; then
        tmux new-session
    fi

    create_new_session="Create new session"
    start_without_tmux="Start without tmux"
    choices="$session_ids\n${create_new_session}:\n${start_without_tmux}:"
    choice="$(echo $choices | fzf | cut -d: -f1)"

    if expr "$choice" : "[0-9]*$" >&/dev/null; then
        tmux attach-session -t "$choice"
    elif [[ "$choice" = "${create_new_session}" ]]; then
        tmux new-session
    elif [[ "$choice" = "${start_without_tmux}" ]]; then
        :
    fi
fi
