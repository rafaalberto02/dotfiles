local REPOS="${0:a:h}/repositories"
local CONFIGS="${0:a:h}/configs"

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
}

[ ! -d $REPOS ] && mkdir -p $REPOS

source_plugin "spaceship-prompt/spaceship-prompt" "spaceship.zsh"
source_plugin "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
source_plugin "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"

. $CONFIGS/zsh-autosuggestions.config.zsh
