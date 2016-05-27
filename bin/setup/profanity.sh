#!/bin/sh

source ~/bin/setup/util.sh

install_package profanity

echo "-- Linking config files:"
symlink ~/dotfiles/profrc ~/.config/profanity/profrc
symlink ~/secret-dotfiles/profanity/ ~/.local/share
