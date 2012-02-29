export PELMERC=$HOME/.pelmerc

### OH-MY-ZSH
ZSH=$HOME/.pelmerc/oh-my-zsh
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git brew django osx pip)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:$PATH

for x in $PELMERC/zsh/*; do
    source $x
done
