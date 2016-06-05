#!/bin/sh 

source ~/bin/setup/util.sh

install_package task
install_package vit-git

symlink ~/dotfiles/taskrc ~/.taskrc
symlink ~/dotfiles/brig-taskrc ~/.brig-taskrc
symlink /run/media/sahib/secret/brig-task ~/.brig-task
symlink /run/media/sahib/secret/task ~/.task
