#!/bin/sh

source ~/bin/setup/util.sh

install_package profanity

echo "-- Linking config files:"
symlink ~/dotfiles/profrc ~/.config/profanity/profrc
symlink /run/media/sahib/secret/profanity/ ~/.local/share
