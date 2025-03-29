local CURRENT_FUNCTIONS="$HOME/.config/zsh/functions"

# Already sourced at config.zsh
# source "$CURRENT_FUNCTIONS/auto_start_tmux.zsh"
source "$CURRENT_FUNCTIONS/install_fzf.zsh"
source "$CURRENT_FUNCTIONS/install_lua.zsh"
source "$CURRENT_FUNCTIONS/install_lua_rocks.zsh"
source "$CURRENT_FUNCTIONS/install_nvm.zsh"
source "$CURRENT_FUNCTIONS/install_rust.zsh"
source "$CURRENT_FUNCTIONS/install_dotnet_completions.zsh"

zsh-defer eval "$(direnv hook zsh)"

unset CURRENT_FUNCTIONS
