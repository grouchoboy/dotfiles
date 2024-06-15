export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="bira"
ZSH_THEME="robbyrussell"
plugins=(git asdf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [ "$HOST" = terminus ]; then
  source $HOME/dotfiles/mac-zshrc
else
  source ~/dotfiles/.zsh_profile
fi
