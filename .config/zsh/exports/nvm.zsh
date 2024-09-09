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

npm() {
    unset -f npm
    load-nvm
    npm "$@"
}

npx() {
    unset -f npx
    load-nvm
    npx "$@"
}

node() {
    unset -f node
    load-nvm
    node "$@"
}

ng() {
    unset -f ng
    load-nvm
    ng "$@"
}

if [ $commands[ng] ]; then
    ng() {
        unfunction $0

        source <(ng completion script)

        $0 "$@"
    }
fi

