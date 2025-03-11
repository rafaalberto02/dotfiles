# Colorize the ls output
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias l.='ls -d .* --color=auto'

# Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Create parent directories on demand
alias mkdir='mkdir -pv'

alias diff='colordiff'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# SSH
alias ssh='TERM=xterm-256color ssh'

alias rebuild='darwin-rebuild switch --flake "$(readlink -f ~/.config/nix-darwin)"'
