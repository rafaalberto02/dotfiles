bind C-s display-popup -E "\
         tmux list-sessions -F '#{session_name}' |\
         sed '/^$/d' |\
         fzf --reverse --header jump-to-session |\
         xargs tmux switch-client -t"
