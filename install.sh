#!/bin/bash

############################
# This script backups current dotfiles and
# create symbolic links to new dotfiles
############################

########## Variables
dot_dir=$(pwd) # dotfiles directory
home_dir=$HOME # home directory
backup_dir=$dot_dir/backup # dotfiles backup directory
files="atom bash_profile config/fish config/fisherman gitconfig vim vimrc" # list of files/folders in homedir
##########

# create backup directory
if [ ! -d "$backup_dir" ]; then
    echo -n "Creating directory $backup_dir for any existing dotfiles in ~ ..."
    mkdir -p $backup_dir
    echo "done"
else
    echo "Skip because directory $backup_dir exists"
fi

# change to home directory
cd $home_dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    # check if file or directory exists and is not a symbolic link
    if [[ ( -d $home_dir/.$file || -f $home_dir/.$file ) && ! -h $home_dir/.$file ]]; then
        echo "Move existing dotfile .$file into $backup_dir"
        mv $home_dir/.$file $backup_dir
        echo "Creating symbolic link to $file inside dotfile directory."
        ln -s $dot_dir/$file $home_dir/.$file
    else
        echo "Skip .$file because it is already a symbolic link or not exists"
    fi
done

# create private git config file
if [ ! -f $dot_dir/gitconfig.private ]; then
    echo "Create gitconfig.private file"
    echo "# Add your private git config here" >> $dot_dir/gitconfig.private
else
    echo "Skip gitconfig.private file creation because file already exists"
fi

# create private fish config file
if [ ! -f $dot_dir/config/fisherman/conf.d/init.private.fish ]; then
    echo "Create init.private.fish file"
    echo "# Add your private fish config here" >> $dot_dir/config/fisherman/conf.d/init.private.fish
else
    echo "Skip init.private.fish file creation because file already exists"
fi
