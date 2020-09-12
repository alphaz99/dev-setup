#!/bin/bash

# Backup vimrc
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc_bak; fi
if [ -e .vim ]; then mv ~/.vim ~/.vim_bak; fi

# Link vim dir
ln -s $(pwd)/vim $HOME/.vim

# Clone dein plugin
mkdir -p ~/.vim/dein/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein
rm ./installer.sh

# Link init.vim to $HOME
ln -s $HOME/.vim/init.vim $HOME/.vimrc

# Create .config dir if it doesn't already exist
mkdir -p ~/.config

# Link .vim to nvim dir
ln -s ~/.vim ~/.config/nvim

# Install plugins
nvim +"call dein#install()" +qall
echo "Vim configuration installed"
echo "Neovim set up"

command -v ctags >/dev/null 2>&1 || { echo >&2 "Please install ctags"; }
