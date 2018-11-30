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
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
export PATH="$HOME/.miniconda3/bin:$PATH"
export PATH="$HOME/bin:$PATH"

eval "$(basher init -)"

#export SPARK_HOME=/usr/local/lib/spark-2.1.0-bin-hadoop2.7
#export LD_LIBRARY_PATH=/usr/local/lib/hadoop-2.7.3/lib/native/:$LD_LIBRARY_PATH
#export PATH=$SPARK_HOME/bin:$PATH
#export PYSPARK_PYTHON='python3'
#export PYSPARK_DRIVER_PYTHON=jupyter
#export PYSPARK_DRIVER_PYTHON_OPTS=notebook
#export AWS_ACCESS_KEY_ID=<value>
#export AWS_SECRET_ACCESS_KEY=<value>

if ! pgrep -x polybar > /dev/null; then
    xss-lock dotfiles/i3/lock.sh &
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
