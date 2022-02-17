#!/bin/zsh

# Set variables
class=uky-gis
mod=$(cat module.txt)
branch=$(cat branch.txt)
folder=$(cat folder.txt)$mod

# Make directory
# mkdir $folder

# Copy list of Github usernames, one name per line
cp list.txt $folder/
cp branch.txt $folder/

# Move into directory, commit, and push
cd $folder
for x in $(cat list.txt)
    do
    repo=https://www.github.com/$class/$mod-$x.git
    remote=$(git ls-remote -h ${repo})
    isLocal=$(ls ${mod}-${x} > /dev/null) 
    if [[ -z ${remote} ]]; then
        echo "NO ************ $x ************"
    else
        echo $x is there
        cd $mod-$x
        git add --all
        git commit -m 'add eval doc'
        git push -u origin $branch
        cd ..
    fi
done

