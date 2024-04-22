# Lazy loading nvm

load-nvm() {
    export NVM_DIR=/opt/homebrew/opt/nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "${NVM_DIR}/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && . "${NVM_DIR}/etc/bash_completion.d/nvm"
}

nvm() {
    unset -f nvm
    load-nvm
    nvm "$@"
}

if [ $commands[ng] ]; then
    ng() {
        unfunction $0

        source <(ng completion script)

        $0 "$@"
    }
fi

