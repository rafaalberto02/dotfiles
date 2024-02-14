REPOS="${0:a:h}/repositories"
CONFIGS="${0:a:h}/configs"

source "$REPOS/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$CONFIGS/zsh-autosuggestions.config.zsh"

source "$REPOS/spaceship-prompt/spaceship.zsh"

## THIS SHOULD BE ALWAYS AT THE END
source "$REPOS/zsh-syntax-highlighting-catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh"
source "$REPOS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
