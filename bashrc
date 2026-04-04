# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

source /etc/os-release

export EDITOR='nvim'
alias vim='nvim'
export PAGER="less"
alias la="ls -la"
alias ".."="cd .."

# export XDG_CONFIG_HOME=$HOME/.config
# -R: handle colors/bolding in man pages
# -i: case-insensitive search
# -F: quit if the file fits on one screen
# -X: don't clear the screen on exit (optional, remove if you prefer clearing)
export LESS="-RiFX"

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

gits() {
    git switch "$(git branch --format='%(refname:short)' | rg -v "^$(git branch --show-current)$" | fzf)"
}

addToPathFront "$HOME/.local/bin"

datadisk() {
        cd "$DATADISK" || return
}

datassd() {
        cd "$DATASSD" || return
}


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
#
if [ "$NAME" = "Fedora Linux" ]; then
    export DATASSD=/run/media/manu/DataSSD
    export DATADISK=/run/media/manu/DataDisk
    alias c="docker compose"
    # shellcheck source=/dev/null
    source <(fzf --bash)
    eval "$(mise activate bash)"
    # addToPathFront $HOME/.local/flutter/bin
    eval "$(direnv hook bash)"
fi

if [ -f "$HOME/.local/share/blesh/ble.sh" ]; then
    source "$HOME/.local/share/blesh/ble.sh"
fi

unset rc

reload() {
    source "$HOME/.bashrc"
}

tmj() {
  # 1. Get the session list (only names)
  # 2. Use fzf for selection
  local session
  session=$(tmux ls -F "#{session_name}" 2>/dev/null | fzf --exit-0 --height 40% --reverse --header="Jump to Session")

  # If no session was selected (e.g., hit ESC), just exit
  [[ -z "$session" ]] && return

  # 3. Logic: If inside tmux, use switch-client. If outside, use attach.
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$session"
  else
    tmux attach-session -t "$session"
  fi
}

export PATH
eval "$(starship init bash)"
