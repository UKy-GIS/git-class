#!/bin/zsh

# Set variables
class=uky-gis
mod=$(cat module.txt)
branch=$(cat branch.txt)
folder=/Volumes/D/_repos/UKy-GIS/_student/_$mod

cp branch.txt $folder/
# Move into directoruy and clone repos
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
        git checkout $branch
        cd ..
    fi
done

