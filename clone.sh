#!/bin/zsh

# Set variables
class=uky-gis
mod=geo409-mod-03
folder=/Volumes/D/_repos/UKy-GIS/_student/_$mod

# Make directory
mkdir $folder

# Copy list of Github usernames, one name per line
cp list.txt $folder/

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
        git clone $repo
        cd $mod-$x
        git branch eval
        git checkout eval
        cd ..
    fi
done

