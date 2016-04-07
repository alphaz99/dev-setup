# Backup vimrc
if [ -e .vimrc ]; then mv ~/.vimrc ~/.vimrc_bak; fi
if [ -e .vim ]; then mv ~/.vim ~/.vim_bak; fi

# Clone vundle plugin
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Clone vim config
git clone https://github.com/alphaz99/vim.git ~/.vim/config
ln -s $HOME/.vim/config/.vimrc $HOME/.vimrc

# Install plugins
vim +PluginInstall +qall

