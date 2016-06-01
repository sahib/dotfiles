#!/bin/sh

source ~/bin/setup/util.sh

#TODO: start
install_package mpd ncmpcpp
symlink dotfiles/ncmpcpp ~/.ncmpcpp
symlink dotfiles/mpd.conf ~/.config/mpd/mpd.conf

mkdir -p ~/.config/mpd/playlists
touch ~/.config/mpd/mpd.log
touch ~/.config/mpd/mpd.pid
touch ~/.config/mpd/mpd.state
