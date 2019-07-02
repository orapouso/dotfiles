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

export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
export PATH="$HOME/.miniconda3/bin:$PATH"
export PATH="$HOME/bin:$PATH"

#if ! pgrep -x xss-lock > /dev/null; then
#    xss-lock $HOME/dotfiles/i3/lock.sh &
#fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:$PATH"

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm"
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/rraposo/.nvm/versions/node/v10.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/rraposo/.nvm/versions/node/v10.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/rraposo/.nvm/versions/node/v10.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/rraposo/.nvm/versions/node/v10.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/rraposo/.nvm/versions/node/v10.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/rraposo/.nvm/versions/node/v10.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
