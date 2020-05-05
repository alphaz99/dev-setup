#!/bin/bash

# Backup vimrc
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc_bak; fi
if [ -e .vim ]; then mv ~/.vim ~/.vim_bak; fi

# Clone dein plugin
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim

# Clone vim config
git clone https://github.com/alphaz99/vim.git ~/.vim/config

ln -s $HOME/.vim/config/.vimrc $HOME/.vimrc
mkdir ~/.vim/ftplugin
ln -s $HOME/.vim/config/haskell.vim $HOME/.vim/ftplugin/haskell.vim

read -p "Use neovim? " yn
case $yn in
    [Yy]* )
        mkdir ~/.config
        ln -s ~/.vim ~/.config/nvim
        ln -s ~/.vim/config/.vimrc ~/.config/nvim/init.vim
        pushd $HOME/.vim/config
        git checkout neovim
        popd

        # Install plugins
        nvim +"call dein#install()" +qall
        echo "Vim configuration installed"
        echo "Neovim set up"
        echo "You will have to install neovim manually"
        ;;
    [Nn]* )
        read -p "Do you want to use neocomplete (default is YouCompleteMe)? " yn
        case $yn in
            [Yy]* )
                # Install fonts
                pushd $HOME/.vim/config
                git checkout neocomplete
                popd
                echo "Using neocomplete"
                echo "You will have to compile vimproc manually. Do this by running make"
                echo "in the vimproc.vim directory. This will be in ~/.vim/bundle/vimproc.vim"
                echo "For Haskell support, please install:
                    ghc
                    cabal-install
                    ghc-mod"
                ;;
            [Nn]* )
                ;;
        esac
        ;;
esac


command -v ctags >/dev/null 2>&1 || { echo >&2 "Please install ctags"; }
