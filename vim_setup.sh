#!/bin/bash

# Backup vimrc
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc_bak; fi
if [ -e .vim ]; then mv ~/.vim ~/.vim_bak; fi

# Clone vim config
git clone https://github.com/alphaz99/vim.git ~/.vim

# Clone dein plugin
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim


# Link vimrc in config to $HOME
ln -s $HOME/.vim/config/.vimrc $HOME/.vimrc

# Create .config dir if it doesn't already exist
mkdir -p ~/.config

# Link .vim to nvim dir
ln -s ~/.vim ~/.config/nvim

# Neovim uses init.vim, link to vimrc
ln -s ~/.vim/.vimrc ~/.config/nvim/init.vim

# Link after/ftplugin

pushd $HOME/.vim
git checkout neovim
popd

# Install plugins
nvim +"call dein#install()" +qall
echo "Vim configuration installed"
echo "Neovim set up"

command -v ctags >/dev/null 2>&1 || { echo >&2 "Please install ctags"; }
