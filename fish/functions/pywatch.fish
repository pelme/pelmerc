function pywatch
    for x in $argv
        set quoted $quoted \'$x\'
    end

    eval $quoted
    watchmedo shell-command --wait --recursive --patterns="*.py" --command="$quoted"
end
