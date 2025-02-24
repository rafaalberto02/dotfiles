local CURRENT_PLUGINS="$HOME/.dotfiles/.config/zsh/plugins"

local REPOS="$CURRENT_PLUGINS/repositories"
local CONFIGS="$CURRENT_PLUGINS/configs"

function source_plugin() {
  local repo=$1
  local entryfile=$2
  
  local plugdir="$REPOS/$repo"
  local entrypoint="$plugdir/$entryfile"

  if [[ ! -d $plugdir ]]; then
    echo "Cloning $repo..."

    git clone --quiet --depth 1 --recursive --shallow-submodules  https://github.com/$repo $plugdir
    
    autoload -U zrecompile

    zrecompile -pq "$entrypoint"
  fi
  
  fpath+=$plugdir
  
  . $entrypoint

  unset repo
  unset entryfile
  unset plugdir
  unset entrypoint
}

[ ! -d $REPOS ] && mkdir -p $REPOS

if [[ ! -e $REPOS/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $REPOS/zsh-syntax-highlighting
  
  zcompile-many $REPOS/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}

  source $REPOS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ ! -e $REPOS/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $REPOS/zsh-autosuggestions

  zcompile-many $REPOS/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}

  source $REPOS/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# source_plugin "spaceship-prompt/spaceship-prompt" "spaceship.zsh"
# source_plugin "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
# source_plugin "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"

# . $CONFIGS/zsh-autosuggestions.config.zsh

unset CURRENT_PLUGINS
unset REPOS
unset CONFIGS
