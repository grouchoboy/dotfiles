function gits --description "Switch git branches using fzf"
    if not command -q git
        echo "gits: git is not installed" >&2
        return 1
    end
    if not command -q fzf
        echo "gits: fzf is not installed" >&2
        return 1
    end

    set -l branch (git branch --format='%(refname:short)' 2>/dev/null | fzf --height 40% --reverse --header="Select git branch")
    test -n "$branch"; and git switch $branch
end
