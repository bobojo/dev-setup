# oh-my-zsh settings
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="josh"
plugins=(brew git git-flow osx)
source $ZSH/oh-my-zsh.sh

# User configuration
fpath=(/usr/local/share/zsh-completions $fpath)
source .bash_profile
