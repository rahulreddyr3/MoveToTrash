#!/bin/bash
dest_dir=${2:-"$HOME/.Trash"}
if [ ! -d "$dest_dir" ];
then
    echo "$dest_dir is not an existing Directory"
    exit 1
fi

if [ -f "$1" ]
then
    actual_filename_without_path=${1##*/}
    actual_filename_without_path_and_extension="${actual_filename_without_path%%.*}"
    extension="${actual_filename_without_path##*.}"
    if [ -e "$dest_dir/$actual_filename_without_path" ]; then
        increment=1
        while [[ -e "$dest_dir/$actual_filename_without_path_and_extension-$increment.$extension" ]]; do
            (( increment++ ))
        done
        mv "$1" "$dest_dir/$actual_filename_without_path_and_extension-$increment.$extension"
        echo "file $1 moved to $dest_dir with name $actual_filename_without_path_and_extension-$increment.$extension"
    else
        if mv "$1" "$dest_dir"; then
            echo "file $1 moved to $dest_dir with name $actual_filename_without_path"
        else
            echo "error happened while moving the file $1 to $dest_dir"
        fi
    fi
elif [ -d "$1" ]
then
    actual_directory_without_path=${1##*/}
    if [ -d "$dest_dir/$actual_directory_without_path" ]; then
        increment=1;
        while [[ -e "$dest_dir/$actual_directory_without_path-$increment" ]]; do
            (( increment++ ))
        done
        mv "$1" "$dest_dir/$actual_directory_without_path-$increment"
        echo "folder $1 moved to $dest_dir with name $actual_directory_without_path-$increment"
    else
        if mv "$1" "$dest_dir/$actual_directory_without_path" ; then
            echo "folder $1 moved to $dest_dir with name $actual_directory_without_path"
        else
            echo "error happened while moving the folder $1 to $dest_dir"
        fi
    fi
else
    echo "$1 is neither a File nor Directory"
    exit 1
fi
exit 0
