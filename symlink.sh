#!/bin/bash

cd "$(dirname "$0")"
ln -s `pwd`/.config/git ~/.config/git
ln -s `pwd`/.vim        ~/.vim

exit
