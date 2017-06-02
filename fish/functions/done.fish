function done
    set branch (git rev-parse --abbrev-ref HEAD)
    git checkout master
    git branch -D $branch
end
