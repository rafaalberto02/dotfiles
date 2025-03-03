NVM_DIR="$HOME/.nvm"

if [[ ! -d $NVM_DIR ]]; then
    echo "Downloading NVM..."

    git clone --depth 1 --branch v0.40.1 https://github.com/nvm-sh/nvm.git $NVM_DIR
 
    echo "Done Downloading NVM..."
fi

export NVM_DIR

zsh-defer source "$NVM_DIR/nvm.sh"
zsh-defer source "$NVM_DIR/bash_completion"

PATH=$NVM_BIN:$PATH
