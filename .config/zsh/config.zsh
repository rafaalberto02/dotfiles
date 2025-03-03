if [[ ! -n $TMUX  ]]; then
    source "$HOME/.config/zsh/functions/auto_start_tmux.zsh"
else
    local CURRENT_CONFIG="$HOME/.config/zsh"

    function zcompile-many() {
      local f
      for f; do zcompile -R -- "$f".zwc "$f"; done
    }

    autoload -Uz compinit && compinit
    [[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump

    source "$CURRENT_CONFIG/exports.zsh"
    source "$CURRENT_CONFIG/aliases.zsh"

    source "$CURRENT_CONFIG/plugins/plugins.zsh"
    source "$CURRENT_CONFIG/functions/functions.zsh"

    # Keybindings
    bindkey '^p' history-search-backward
    bindkey '^n' history-search-forward

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
    unset CURRENT_CONFIG
fi
