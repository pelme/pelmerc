abbr --add g git
abbr --add gs git status
abbr --add gc git commit
abbr --add gd git diff
abbr --add gl git log
abbr --add gds git diff --staged
abbr --add gco git checkout
abbr --add gcp git cherry-pick
abbr --add gpr git pull --rebase
abbr --add grb git rebase
abbr --add gp git push
abbr --add gpf git push --force-with-lease
abbr --add gri git rebase -i origin/master
abbr --add gr "git fetch; git rebase origin/master"
abbr --add glm git log --oneline --reverse origin/master..
abbr --add gbr git branch
abbr --add gdm git diff origin/master
abbr --add gaa git add --all
abbr --add grm git rm
abbr --add grs git reset
abbr --add grsh git reset HEAD^
abbr --add wip git add --all \; git commit -m WIP

abbr --add ax aws-vault exec pk -- 
abbr --add dj django-admin
abbr --add djr django-admin runserver
abbr --add djs django-admin shell_plus --quiet-load

abbr --add tf terraform
abbr --add tfp terraform plan
abbr --add tfa terraform apply

abbr --add cd.. cd ..
abbr --add cd... cd ../..
abbr --add cd.... cd ../../..

abbr --add b "git push --force-with-lease ; sleep 1; pkbuild"
