# ADVICE!!!
#
# zcompile-many function is declared at config.zsh

local CURRENT_PLUGINS="$ZSH_CONFIG/plugins"

local PLUGINS_REPOS="$HOME/.local/shell/plugins"
local PLUGINS_CONFIGS="$CURRENT_PLUGINS/configs"

[ ! -d $PLUGINS_REPOS ] && mkdir -p $PLUGINS_REPOS

if [[ ! -e $PLUGINS_REPOS/gitstatus ]]; then
  git clone --depth=1 https://github.com/romkatv/gitstatus.git $PLUGINS_REPOS/gitstatus
  
  zcompile-many $PLUGINS_REPOS/gitstatus/{gitstatus.*.zsh}
fi

if [[ ! -e $PLUGINS_REPOS/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGINS_REPOS/zsh-syntax-highlighting
  
  zcompile-many $PLUGINS_REPOS/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi

if [[ ! -e $PLUGINS_REPOS/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $PLUGINS_REPOS/zsh-autosuggestions

  zcompile-many $PLUGINS_REPOS/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi

source $PLUGINS_REPOS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUGINS_REPOS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS_REPOS/gitstatus/gitstatus.prompt.zsh

source $PLUGINS_CONFIGS/gitstatus-prompt.config.zsh
source $PLUGINS_CONFIGS/zsh-autosuggestions.config.zsh

unset CURRENT_PLUGINS
unset PLUGINS_REPOS
unset PLUGINS_CONFIGS
