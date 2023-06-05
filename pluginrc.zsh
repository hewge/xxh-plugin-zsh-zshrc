# This script will be executed ON THE HOST when you connect to the host.
# Put here your functions, environment variables, aliases and whatever you need.

CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

plugins=(git vi-mode fzf mongocli gitignore kubectl kubectx z fd catimg colorize emoji fasd grunt gulp helm ripgrep rsync sudo)

KEYTIMEOUT=1

if which exa &> /dev/null; then
    alias ls="exa --icons -@mF --git"
    alias ll="exa --icons -@lmhF --git"
    alias la="exa --icons -@lamhF --git"
else
    alias ls="ls --color=always"
    alias ll="ls -l"
    alias la="ls -al"
fi

[[ ! -f $CURR_DIR/p10k.zsh ]] || source $CURR_DIR/p10k.zsh
[[ ! -f $CURR_DIR/fzf.zsh ]] || source $CURR_DIR/fzf.zsh

source $ZSH/oh-my-zsh.sh
