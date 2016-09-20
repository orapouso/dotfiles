# load zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating zgen save"
    zgen prezto prompt theme 'sorin'

    # prezto and modules
    zgen prezto
    zgen prezto git
    zgen prezto utility
    zgen prezto command-not-found
    zgen prezto syntax-highlighting

    # save
    zgen save
fi

export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init -)"
