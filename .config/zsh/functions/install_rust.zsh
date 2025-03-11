if [[ ! -e $HOME/.cargo/env ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi

source $HOME/.cargo/env
