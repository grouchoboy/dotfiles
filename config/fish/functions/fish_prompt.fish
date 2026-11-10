# Two-line prompt replicating ../starship.toml, gruvbox-light-hard flavored
#
# Line 1:  user@host in ~/dir git-branch (STATE) (*) (↑1↓2≡3)
# Line 2:  ❯  (purple on success, red on failure)
#
# Matching starship settings:
#   - username/hostname: starship defaults (only shown on SSH or as root)
#   - directory: blue, truncated like truncation_length = 3
#   - git_branch: gray, no symbol
#   - git_status: "(*)" red, " (↑ahead↓behind≡stash)" in aqua
#   - git_state: gray, e.g. "(REBASING 3/5)"
#   - character: purple ❯ / red ❯ on error
function fish_prompt
    set -l last_status $status

    # --- gruvbox light (hard) palette ---
    # muted colors designed for the light background (#f9f5d7)
    set -l c_gray   928374 # gray 244
    set -l c_red    9d0006 # red
    set -l c_green  79740e # green
    set -l c_yellow b57614 # yellow
    set -l c_blue   076678 # blue
    set -l c_purple 8f3f71 # purple
    set -l c_aqua   427b58 # aqua
    set -l c_bred   cc241d # bright red (alert accent)
    set -l c_bgreen 98971a # bright green

    # --- user@host (starship default: only when SSH or root) ---
    if test (id -u) -eq 0; or set -q SSH_CONNECTION
        set_color $c_yellow
        echo -n $USER
        set_color $c_bgreen
        echo -n '@'$hostname
        set_color $c_gray
        echo -n ' in '
        set_color normal
    end

    # --- directory (blue, like starship truncation_length = 3) ---
    set_color $c_blue
    echo -n (prompt_pwd -D 3)
    set_color normal

    # --- git branch + state + status ---
    __fish_prompt_git

    # --- line break + character ---
    echo

    if test $last_status -eq 0
        set_color $c_purple
    else
        set_color $c_red
    end
    echo -n '❯ '
    set_color normal
end

function __fish_prompt_git
    git rev-parse --is-inside-work-tree >/dev/null 2>&1; or return

    # gruvbox light palette (mirrored here to keep the function standalone)
    set -l c_gray   928374
    set -l c_red    9d0006
    set -l c_aqua   427b58
    set -l c_bred   cc241d

    set -l gitdir (git rev-parse --git-dir 2>/dev/null)
    test -n "$gitdir"; or return

    # --- branch (branch name, or short hash when detached) ---
    set -l branch (git symbolic-ref --short HEAD 2>/dev/null; \
        or git describe --tags --exact-match 2>/dev/null; \
        or git rev-parse --short HEAD 2>/dev/null)

    # --- git state (starship git_state) ---
    set -l state ''
    if test -d "$gitdir/rebase-merge"
        set -l done (count <"$gitdir/rebase-merge/done" 2>/dev/null)
        set -l todo (count <"$gitdir/rebase-merge/git-rebase-todo" 2>/dev/null)
        set state "REBASING $done/"(math $done + $todo)
    else if test -d "$gitdir/rebase-apply"
        if test -f "$gitdir/rebase-apply/applying"
            set state AM
        else
            set state REBASING
        end
    else if test -f "$gitdir/MERGE_HEAD"
        set state MERGING
    else if test -f "$gitdir/CHERRY_PICK_HEAD"
        set state CHERRY-PICKING
    else if test -f "$gitdir/REVERT_HEAD"
        set state REVERTING
    else if test -f "$gitdir/BISECT_LOG"
        set state BISECTING
    end

    # --- git status counts (starship git_status) ---
    set -l untracked 0
    set -l staged 0
    set -l modified 0
    set -l renamed 0
    set -l deleted 0
    set -l conflicted 0
    for line in (git status --porcelain 2>/dev/null)
        set -l xy (string sub -s 1 -l 2 -- $line)
        switch $xy
            case '??'
                set untracked (math $untracked + 1)
            case UU AA DD AU UD UA DU
                set conflicted (math $conflicted + 1)
            case '*'
                set -l x (string sub -s 1 -l 1 -- $line)
                set -l y (string sub -s 2 -l 1 -- $line)
                if test $x != ' ' -a $x != '?'
                    set staged (math $staged + 1)
                    if test $x = R -o $y = R
                        set renamed (math $renamed + 1)
                    end
                    if test $x = D -o $y = D
                        set deleted (math $deleted + 1)
                    end
                end
                if test $y != ' ' -a $y != '?'
                    set modified (math $modified + 1)
                    if test $x = R -o $y = R
                        set renamed (math $renamed + 1)
                    end
                    if test $y = D
                        set deleted (math $deleted + 1)
                    end
                end
        end
    end

    # --- ahead/behind ---
    set -l ahead_behind ''
    if git rev-parse --abbrev-ref --symbolic-full-name '@{upstream}' >/dev/null 2>&1
        set -l counts
        git rev-list --left-right --count 'HEAD...@{upstream}' 2>/dev/null | read -l --list counts
        set -l ahead $counts[1]
        set -l behind $counts[2]
        set -q ahead[1]; or set ahead 0
        set -q behind[1]; or set behind 0
        if test $ahead -gt 0 -o $behind -gt 0
            set ahead_behind '↑'$ahead'↓'$behind
        end
    end

    # --- stashes (starship: ≡, count hidden when 1) ---
    set -l stashed ''
    set -l stash_count (git stash list 2>/dev/null | count)
    if test $stash_count -eq 1
        set stashed '≡'
    else if test $stash_count -gt 1
        set stashed '≡'$stash_count
    end

    # --- render ---
    # separator, then branch in gray
    echo -n ' '
    echo -n (set_color $c_gray)$branch(set_color normal)

    # state in gray: "(REBASING 3/5) "
    if test -n "$state"
        echo -n (set_color $c_gray)'('$state') '(set_color normal)
    end

    # "(*)" in bright red when any change exists
    set -l changes (math $untracked + $staged + $modified + $renamed + $deleted + $conflicted)
    if test $changes -gt 0
        echo -n (set_color $c_bred)'(*)'(set_color normal)
    end

    # " (↑1↓2≡3)" in aqua
    set -l extra $ahead_behind$stashed
    if test -n "$extra"
        echo -n ' '(set_color $c_aqua)$extra(set_color normal)
    end
end
