# Colorize the ls output
alias ls='ls --color=auto'

# Use a long listing format
alias ll='ls -la'

# Show hidden files
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

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# SSH
alias ssh='TERM=xterm-256color ssh'
