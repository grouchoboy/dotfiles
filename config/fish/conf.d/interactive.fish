if status is-interactive
    # fzf key bindings and completion
    if command -q fzf
        fzf --fish | source
    end

    # direnv shell integration
    if command -q direnv
        direnv hook fish | source
    end

    # Starship prompt
    # if command -q starship
    #     starship init fish | source
    # end
end
