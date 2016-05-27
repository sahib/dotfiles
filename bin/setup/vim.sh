#!/bin/sh

source ~/bin/setup/util.sh

git clone https://github.com/studentkittens/vimrc ~/.vim
sh ~/.vim/install.sh

# I have my own vimrc:
rm ~/.vimrc
symlink ~/dotfiles/vimrc ~/.vimrc
