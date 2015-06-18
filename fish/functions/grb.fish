function grb

    if count $argv
        set num_commits $argv[1]
    else
        set num_commits 5
    end

    echo git rebase -i "HEAD~$num_commits"
end
