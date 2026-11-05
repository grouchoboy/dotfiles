function datassd --description "Change directory to DATASSD"
    if test -n "$DATASSD"
        cd "$DATASSD"
    else
        echo "DATASSD variable is not set" >&2
        return 1
    end
end
