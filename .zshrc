# zsh-autocomplete config
#if type brew &>/dev/null
#then
#  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
#
#  autoload -Uz compinit
#  compinit
#fi

#source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$HOME/.config/zsh/config.zsh"
#
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
#ZSH_AUTOSUGGEST_STRATEGY=(completion)
#
## Custom alias
#[ -f ~/.alias_config ] && source ~/.alias_config
#[ -f ~/.LESS_TERMCAP ] && source ~/.LESS_TERMCAP
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh;
#
#export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
#
#export NVM_DIR="$HOME/.nvm"
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
#
#export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
#
#export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/ruby/lib"
#
#export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/ruby/include"
#
#export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openjdk/include"
#
#export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
#
#export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
