function tmj --description "Jump to tmux session with fzf"
    if not command -q tmux
        echo "tmj: tmux is not installed" >&2
        return 1
    end
    if not command -q fzf
        echo "tmj: fzf is not installed" >&2
        return 1
    end

    set -l session (tmux ls -F "#{session_name}" 2>/dev/null | fzf --exit-0 --height 40% --reverse --header="Jump to Session")
    test -z "$session"; and return

    if test -n "$TMUX"
        tmux switch-client -t "$session"
    else
        tmux attach-session -t "$session"
    end
end
