#!/bin/sh

source ~/bin/setup/util.sh

if [[ -d ~/mail ]]; then
    echo "-- You might want to rsync the ~/mail dir first."
    echo "-- Iniial syncing and indexing might take some time otherwise."
    echo "-- (Hit enter to continue)"
    read
fi

echo "-- Installing mail packages:"
install_package isync msmtp abook
install_package notmuch 
install_package alot
install_package afew-git
install_package w3m

echo "-- Linking config files:"
symlink ~/dotfiles/msmtprc ~/.msmtprc
symlink ~/dotfiles/mbsyncrc ~/.mbsyncrc
symlink ~/dotfiles/notmuch-config ~/.notmuch-config
symlink ~/dotfiles/alot-config ~/.config/alot/config
symlink ~/dotfiles/afew-config ~/.config/afew/config

symlink /run/media/sahib/secret/abook ~/.abook
symlink /run/media/sahib/secret/mail ~/.mail

echo "-- Done. Reload i3 to enable automatic mail syncing."
