function datadisk --description "Change directory to DATADISK"
    if test -n "$DATADISK"
        cd "$DATADISK"
    else
        echo "DATADISK variable is not set" >&2
        return 1
    end
end
