#!/bin/bash

# This script sets up all config from this repo.

ln -s ../config/i3/ $HOME/.config/i3
ln -s ../config/i3status $HOME/.config/i3status
ln -s ../config/alacritty $HOME/.config/alacritty
ln -s ../config/autorandr $HOME/.config/autorandr
ln -s ../config/redshift $HOME/.config/redshift

ln -s ../gitconfig $HOME/.gitconfig
ln -s ../zshrc $HOME/.zshrc
ln -s ../Xresources $HOME/.Xresources

# As root
ln -s ../config/ly/config.ini /etc/ly/config.ini
