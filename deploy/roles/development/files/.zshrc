export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"
DISABLE_AUTO_UPDATE="true"

HIST_STAMPS="yyyy.mm.dd"
COMPLETION_WAITING_DOTS="true"

# TODO: Add plugins for aws, bower etc.y
plugins=(git pip)

export EDITOR='vim'
source $ZSH/oh-my-zsh.sh
source $HOME/.profile
