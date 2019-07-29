# load zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating zgen save"
    # zgen prezto prompt theme 'sorin'
    zgen load denysdovhan/spaceship-prompt spaceship

    # prezto and modules
    # zgen prezto
    # zgen prezto git
    # zgen prezto utility
    # zgen prezto command-not-found
    # zgen prezto syntax-highlighting
    # zgen prezto autosuggestions

    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load tarruda/zsh-autosuggestions

    # save
    zgen save
fi
SPACESHIP_PACKAGE_SYMBOL=@

export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
export PATH="$HOME/.miniconda3/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:$PATH"

# Set up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rraposo/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rraposo/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/rraposo/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/rraposo/.miniconda/bin:$PATH"
    fi
fi
conda deactivate
unset __conda_setup
# <<< conda initialize <<<

