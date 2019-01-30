# MoVe_to_Trash
A command line tool for replacing "Move to trash" option in mac. It can move files and directories from any where in mac trash.
It appends the file/folder name with a number if an other file/folder with same name exists in the destination.
It can also be used to move files/folders to other destination than trash.

### Installation
* To install mvt run the following commands

```bash
brew tap rahulreddyr3/homebrew-rrr-osx
brew install mvt
```

### How to use
To move a file or folder to trash use 

```
mvt <file_or_folder_name_with_path>
```
To move a file or folder to any other destination folder use

```
mvt <file_or_folder_name_with_path> <destination_folder_with_path>
```

* Note: Avoid `/` at the end of folder names and paths while giving input.

# Contributors
1. [Rahul reddy](https://rahulreddyr3.github.io)
