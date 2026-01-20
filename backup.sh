export XDG_CONFIG_HOME=$HOME/.config

export EDITOR='nvim'
alias vim='nvim'
alias em="emacs -nw"
# alias c="docker-compose"

# alias k="kubectl"
#source <(kubectl completion zsh)

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

gits() {
    git switch $(git branch | grep -v '*' | fzf)
}

addToPathFront $HOME/.local/bin

datadisk() {
	cd /run/media/manu/DataDisk
}

datassd() {
	cd /run/media/manu/DataSSD
}

HOST=$(awk -F= '/^NAME=/{print $2}' /etc/os-release | tr -d '"')

if [ "$HOST" = "openSUSE Tumbleweed" ]; then
    eval "$(mise activate zsh)"
fi


if [ "$HOST" = "Fedora Linux" ]; then
    source /usr/share/fzf/shell/key-bindings.zsh
    # eval "$(~/.local/bin/mise activate zsh)"
    eval "$(direnv hook zsh)"
fi

if [ "$HOST" = "Arch Linux" ]; then
    eval "$(mise activate zsh)"
    export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/manu/.local/share/flatpak/exports/share:${XDG_DATA_DIRS}"
fi

## Inside a distrobox container
if [ -e /run/.containerenv ] ; then
    ZSH_THEME="bira"
    source $ZSH/oh-my-zsh.sh
    source <(fzf --zsh)

    # alias podman="distrobox-host-exec podman"
    # alias c="podman compose"
    # sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/podman
    export PODMAN_COMPOSE_WARNING_LOGS="false"
    alias docker="distrobox-host-exec docker"
    alias c="distrobox-host-exec docker compose"
    # export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
    # export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
fi

HOSTNAME=$(hostname)

if [ "$HOSTNAME" = "dooland" ] ; then
    source $HOME/dotfiles/zshwork
fi

