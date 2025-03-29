#!/usr/bin/env bash

selectedPath=$(find -L "$HOME"/.personal "$HOME"/.work/csonline "$HOME"/.config -maxdepth 1 -type d -print | fzf)

if [[ -d $selectedPath ]]; then
    selectedPath=$(realpath "$selectedPath")

    sessionName=$(basename "$selectedPath" | tr -dc '[:alnum:]\n\r')

    tmux_pid=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_pid ]]; 
    then
        exec tmux new-session -s "$sessionName" -c "$selectedPath"

        exit 0;
    fi

    if ! tmux has-session -t "$sessionName" 2> /dev/null;
    then
        tmux new-session -s "$sessionName" -c "$selectedPath" -d
    fi

    if [[ -z $TMUX ]];
    then
        tmux attach-session -t "$sessionName" 

        exit 0;
    else
        tmux switch-client -t "$sessionName"

        exit 0;
    fi
fi
