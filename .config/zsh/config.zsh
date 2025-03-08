local CURRENT_CONFIG="$HOME/.config/zsh"

source "$CURRENT_CONFIG/exports.zsh"
source "$CURRENT_CONFIG/aliases.zsh"

if [[ ! -n $TMUX  ]]; then
    source "$HOME/.config/zsh/functions/auto_start_tmux.zsh"
else
    function zcompile-many() {
        local f
        for f; do zcompile -R -- "$f".zwc "$f"; done
    }

    autoload -Uz compinit && compinit
    [[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump


    source "$CURRENT_CONFIG/plugins/plugins.zsh"
    source "$CURRENT_CONFIG/functions/functions.zsh"

    # Keybindings
    bindkey '^p' history-search-backward
    bindkey '^n' history-search-forward

    functions find-and-create-session() {
        local selectedPath=$(find -L $HOME/.personal $HOME/.config -maxdepth 1 -type d -print | fzf)

        if [[ -d $selectedPath ]]; then
            selectedPath=$(realpath $selectedPath)

            local sessionName=$selectedPath:t

            $(tmux has-session -t $sessionName &> /dev/null)

            if [ $? != 0 ]
            then
                $(tmux new-session -s $sessionName -c $selectedPath -d &> /dev/null)
            fi

            $(tmux switch-client -t $sessionName &> /dev/null)
        fi
    }

    zle -N find-and-create-session

    bindkey '^F' find-and-create-session
    bindkey -M emacs '^F' find-and-create-session
    bindkey -M vicmd '^F' find-and-create-session
    bindkey -M viins '^F' find-and-create-session

    # HistoryConfigs
    HISTSIZE=5000
    SAVEHIST=5000
    HISTFILE=~/.zsh_history
    HISTDUP=erase

    setopt appendhistory
    setopt sharehistory
    setopt extended_history
    setopt hist_ignore_space
    setopt hist_ignore_all_dups
    setopt hist_save_no_dups
    setopt hist_ignore_dups
    setopt hist_find_no_dups
    setopt no_case_glob

    # Completion Styling
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

    set -o vi

    unfunction zcompile-many
fi

unset CURRENT_CONFIG
