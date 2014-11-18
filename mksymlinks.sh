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

# Where the dotfiles are
D=$HOME/.dotfiles
# Be in home for brevity
cd $HOME

# Files to symlink
for F in .profile .vim .vimrc; do
        # Make a backup
        if [[ -e $F ]]; then
                echo $HOME/$F -> $HOME/$F.bak
                mv $HOME/$F $HOME/$F.bak
        fi
        ln -s $D/$F
        ls -adl $F
done

# Restore known_hosts
echo Restoring $HOME/.ssh/known_hosts
$HOME/.dotfiles/restore_known_hosts
