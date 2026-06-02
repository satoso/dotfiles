#!/bin/bash

cd "$(dirname "$0")"
ln -s `pwd`/.config/git ~/.config/git
touch ~/.config/git/config
# ln -s `pwd`/.config/vim ~/.vim  # for old vim
ln -s `pwd`/.config/vim ~/.config/vim

exit
