function done
    set branch (git rev-parse --abbrev-ref HEAD)
    git switch master
    git branch -D $branch
end
