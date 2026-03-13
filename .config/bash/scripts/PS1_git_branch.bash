#!/usr/bin/env bash

source ~/.config/bash/scripts/ansi_colors.bash

if [ ! -d .git ] && ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    exit 0
fi

bash_branch=$(git branch --show-current 2>/dev/null)

if [[ -n "$bash_branch" ]]; then
    echo -e "${BYellow}${bash_branch} ${Color_Off}";
else
    exit 0
fi

