export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

DARWIN=$(uname)

if [ "$DARWIN" = "Darwin" ]; then
  source $HOME/dotfiles/mac-zshrc
else
  source ~/dotfiles/zsh_profile
fi

