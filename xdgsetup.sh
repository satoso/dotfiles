#!/bin/bash

# sets up XDG Base Directory
# ref: https://specifications.freedesktop.org/basedir-spec/latest/

echo 'export XDG_CONFIG_HOME=$HOME/.config' >> ~/.profile
mkdir -p $HOME/.config

echo 'export XDG_CACHE_HOME=$HOME/.cache' >> ~/.profile
mkdir -p $HOME/.cache

echo 'export XDG_DATA_HOME=$HOME/.local/share' >> ~/.profile
mkdir -p $HOME/.local/share

echo 'export XDG_STATE_HOME=$HOME/.local/state' >> ~/.profile
mkdir -p $HOME/.local/state

exit
