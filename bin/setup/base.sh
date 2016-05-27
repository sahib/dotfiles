#!/bin/sh

# Make sure we can access the util easily:
ln -s ~/dotfiles/bin ~/bin
source ~/bin/setup/util.sh

# Install base utilites:
install_package git vim secret-tool zsh
install_package dmenu feh sxiv gnome-terminal
install_package go redshift
install_package kupfer
install_package twmn-git

# Download & install oh-my-zsh
echo "-- Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "-- Symlinking basic config files..."
symlink ~/dotfiles/zshrc ~/.zshrc
symlink ~/dotfiles/gitconfig ~/.gitconfig
symlink ~/dotfiles/xmodmaprc ~/.xmodmaprc
symlink ~/secret-dotfiles/ssh ~/.ssh
symlink ~/secret-dotfiles/gnupg ~/.gnupg

# TODO: secret-tool export
