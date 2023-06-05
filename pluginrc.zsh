# This script will be executed ON THE HOST when you connect to the host.
# Put here your functions, environment variables, aliases and whatever you need.

CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

plugins=(git vi-mode fzf mongocli gitignore kubectl kubectx z fd catimg colorize emoji fasd grunt gulp helm ripgrep rsync sudo)
source $ZSH/oh-my-zsh.sh
