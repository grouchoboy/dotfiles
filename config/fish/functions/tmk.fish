function tmk --description "Kill tmux session with fzf"
    if not command -q tmux
        echo "tmk: tmux is not installed" >&2
        return 1
    end
    if not command -q fzf
        echo "tmk: fzf is not installed" >&2
        return 1
    end

    set -l sessions (tmux ls -F "#{session_name}" 2>/dev/null | fzf --multi --exit-0 --height 40% --reverse --header="Kill Session(s)")
    test -z "$sessions"; and return

    for session in $sessions
        tmux kill-session -t "$session"
    end
end
