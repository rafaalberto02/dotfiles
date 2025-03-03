# ADVICE!!!
#
# zcompile-many function is declared at config.zsh

local CURRENT_PLUGINS="$HOME/.dotfiles/.config/zsh/plugins"

local PLUGINS_REPOS="$CURRENT_PLUGINS/repositories"
local PLUGINS_CONFIGS="$CURRENT_PLUGINS/configs"

[ ! -d $PLUGINS_REPOS ] && mkdir -p $PLUGINS_REPOS

if [[ ! -e $PLUGINS_REPOS/zsh-defer ]]; then
  git clone --depth=1 https://github.com/romkatv/zsh-defer.git $PLUGINS_REPOS/zsh-defer
  
  zcompile-many $PLUGINS_REPOS/zsh-defer/zsh-defer.plugin.zsh
fi

if [[ ! -e $PLUGINS_REPOS/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGINS_REPOS/zsh-syntax-highlighting
  
  zcompile-many $PLUGINS_REPOS/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi

if [[ ! -e $PLUGINS_REPOS/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $PLUGINS_REPOS/zsh-autosuggestions

  zcompile-many $PLUGINS_REPOS/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi

if [[ ! -e $PLUGINS_REPOS/catppuccin ]]; then
  git clone --depth=1 https://github.com/catppuccin/zsh-syntax-highlighting.git $PLUGINS_REPOS/catppuccin

  zcompile-many $PLUGINS_REPOS/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
fi

source $PLUGINS_REPOS/zsh-defer/zsh-defer.plugin.zsh

zsh-defer source $PLUGINS_REPOS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zsh-defer source $PLUGINS_REPOS/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source $PLUGINS_REPOS/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

zsh-defer source $PLUGINS_CONFIGS/zsh-autosuggestions.config.zsh

unset CURRENT_PLUGINS
unset PLUGINS_REPOS
unset PLUGINS_CONFIGS
