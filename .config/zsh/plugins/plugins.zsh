REPOS="${0:a:h}/repositories"
CONFIGS="${0:a:h}/configs"

function source_plugin {
  local repo=$1
  local entryfile=$2
  
  local plugdir="$REPOS/$repo"
  local entrypoint="$plugdir/$entryfile"
  
  echo "$plugdir"
  echo "$entrypoint"

  if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."

      git clone --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
  fi
  
  source $entrypoint;
}

(source_plugin "spaceship-prompt/spaceship-prompt" "spaceship.zsh")

(source_plugin "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh")
(source_plugin "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh")
