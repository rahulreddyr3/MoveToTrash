#!/bin/bash
dest_dir=${2:-"$HOME/.Trash"}
if [ ! -d $2 ];
then
    echo "$2 is not an existing Directory"
    exit 1;
fi

if [ -f $1 ]
then
    actual_filename=$1;
    new_filename="${actual_filename%%.*}";
    extension="${actual_filename##*.}";
    if [ -e "$dest_dir/$actual_filename" ]; then
        increment=1;
        while [[ -e "$dest_dir/$new_filename-$increment.$extension" ]]; do
            (( increment++ ))
        done
        mv $1 "$dest_dir/$new_filename-$increment.$extension"
        echo "file $1 moved to trash with name $new_filename-$increment.$extension"
    else
        if mv $1 $dest_dir; then
            echo "file $1 moved to trash with name $actual_filename"
        else
            echo "error happened while moving the file $1 to trash"
        fi
    fi
elif [ -d $1 ]
then
    actual_directory_name=$1;
    if [ -d "$dest_dir/$actual_directory_name" ]; then
        increment=1;
        while [[ -e "$dest_dir/$actual_directory_name-$increment" ]]; do
            (( increment++ ))
        done
        mv $1 "$dest_dir/$actual_directory_name-$increment"
        echo "folder $1 moved to trash with name $actual_directory_name-$increment"
    else
        if mv $1 "$dest_dir/$actual_directory_name" ; then
            echo "folder $1 moved to trash with name $actual_directory_name"
        else
            echo "error happened while moving the folder $1 to trash"
        fi
    fi
else
    echo "$1 is neither a File nor Directory"
    exit 1;
fi
exit 0;
