export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT="%(?:%{$reset_color%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$reset_color%}%c"
# PROMPT+=' $(git_prompt_info)'
# ZSH_THEME_GIT_PROMPT_PREFIX="git:("
# ZSH_THEME_GIT_PROMPT_SUFFIX=" "
# ZSH_THEME_GIT_PROMPT_DIRTY=") %1{✗%}"
# ZSH_THEME_GIT_PROMPT_CLEAN=")"



DARWIN=$(uname)

if [ "$DARWIN" = "Darwin" ]; then
  source $HOME/dotfiles/mac-zshrc
else
  source ~/dotfiles/.zsh_profile
fi

