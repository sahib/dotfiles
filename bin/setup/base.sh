#!/bin/sh

# Make sure we can access the util easily:
ln -s ~/dotfiles/bin ~/bin
source ~/bin/setup/util.sh

# Install base utilites:
install_package git vim pass zsh
install_package dmenu feh sxiv gnome-terminal
install_package go redshift
install_package kupfer
install_package twmn-git

# Download & install oh-my-zsh
echo "-- Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "-- Symlinking basic config files..."
symlink ~/dotfiles/password-store ~/.password-store/
symlink ~/dotfiles/zshrc ~/.zshrc
symlink ~/dotfiles/gitconfig ~/.gitconfig
symlink ~/dotfiles/xmodmaprc ~/.xmodmaprc
symlink ~/dotfiles/secret/ssh ~/.ssh
symlink ~/dotfiles/secret/gnupg ~/.gnupg
