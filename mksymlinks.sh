#!/bin/sh
# mksmylinks.sh
# script to make symlinks from $HOME/.dotfiles
# By J. Stuart McMurray
# Created 20141118
# Last modified 20141118

set -e

# Assumptions:
#   $HOME is set
#   $HOME/.dotfiles is the directory containing the files to link

# Get submodules
git submodule init
git submodule update

# Where the dotfiles are
D=$HOME/.dotfiles
# Be in home for brevity
cd $HOME

function backup {
        local SRC=$1
        local DST=$1.bak
        if [[ -e $DST ]]; then
                backup $DST
        fi
        echo $SRC '->' $DST
        mv $SRC $DST
}

# Files to symlink
for F in .profile .vim .vimrc .gitconfig .gitignore; do
        # Make a backup
        if [[ -e $F ]]; then
                backup $F
        fi
        ln -s $D/$F
        ls -adl $F
done

# Restore known_hosts
echo Restoring $HOME/.ssh/known_hosts
$HOME/.dotfiles/restore_known_hosts
