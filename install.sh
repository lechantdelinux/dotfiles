#!/bin/bash
############################
# Inspired by http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="bin/vim bin/vimura config/i3/config config/i3blocks config/i3status/config config/neofetch/arch_6colors.txt config/neofetch/config.conf config/ranger/rc.conf config/rofi/diy.rasi config/termite/config config/zathura/zathurarc vimrc wallpapers config/conky/conky.conf bashrc vim/indent/tex.vim"    # list of files/folders to symlink in homedir
dirs="bin config/i3 config/i3status config/neofetch config/ranger config/rofi config/termite config/zathura config/conky vim/indent"    # list of directories to create

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# create directories that will house symlinks
for newdir in $dirs; do
   echo "Creating directory ~/.$newdir"
   mkdir -p ~/.$newdir
done

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/.dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done

