#!/bin/sh

source ~/bin/setup/util.sh

echo "-- Installing i3 and dependencies:"
install_package i3-wm
install_package ttf-font-awesome ttf-font-icons

# i3blocks deps:
echo "-- Installing i3 and dependencies:"
install_package sysstat acpi lm_sensors
install_package i3blocks-git

echo "-- Linking i3 config files:"
symlink ~/dotfiles/i3.config     ~/.config/i3/config
symlink ~/dotfiles/i3blocks.conf .i3blocks.conf

echo "-- Fixing theming:"
install_package npm
sudo npm install -g i3-style
i3-style --save --reload base16-tomorrow
