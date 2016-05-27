#!/bin/sh

echo "-- Installing mail packages:"
install_package isync msmtp
install_package notmuch 
install_package alot
install_package afew

echo "-- Linking config files:"
symlink ~/dotfiles/msmtprc ~/.msmtprc
symlink ~/dotfiles/mbsyncrc ~/.mbsyncrc
symlink ~/dotfiles/notmuch-config ~/.notmuch-config
symlink ~/dotfiles/alot-config ~/.config/alot/config
symlink ~/dotfiles/afew-config ~/.config/afew/config
