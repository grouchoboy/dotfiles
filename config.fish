set -gx EDITOR vim

set PATH /Applications/Racket/bin $PATH
set PATH ~/bin $PATH
set PATH ~/.cargo/bin $PATH

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

function emacs
	command emacs &
end
