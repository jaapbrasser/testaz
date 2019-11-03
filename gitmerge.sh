gitlog=$(git log --oneline -1)
regex="\[skip ci\]"
if [[ ! $gitlog =~ $regex ]]
then
    git config --global user.email "noreply@jaapbrasser.com"
    git config --global user.name "jaapbrasser"
    git branch master
    git checkout master
    date > timestamp.log
    git status
    git branch
    git add *
    git commit -m "[skip ci] Updating based on merge to master $(date)"
    git push -u origin master
fi