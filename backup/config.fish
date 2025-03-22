set -gx EDITOR vim
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8


set PATH /Applications/Racket/bin $PATH
set PATH ~/bin $PATH
set PATH ~/.cargo/bin $PATH

set -x DJANGO_PATH "~/code/library/django"

status --is-interactive; and source (rbenv init -|psub)

# golang
set -x -U GOPATH $HOME/code/go

set PATH $GOPATH/bin $PATH

# load pyenv
if command -v pyenv 1>/dev/null 2>&1
	pyenv init - | source
end

# ctags for python
function ctags_python
	ctags --languages=python --python-kinds=-i -R .
end

# poetry
set PATH $HOME/.poetry/bin $PATH

function poetry_shell
 	source (dirname (poetry run which python))/activate.fish
end

# alias

alias manage "./manage.py"
alias gco "git checkout"
alias activate "source venv/bin/activate.fish"

set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
