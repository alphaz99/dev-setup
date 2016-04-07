# Clone the prezto repo
git clone --recursive https://github.com/alphaz99/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Remove previous zsh configuration
if [ -e ~/.zshrc ]; then mv ~/.zshrc ~/.zshrc_bak; fi
rm ~/.zshrc

# Install prezto
zsh install_prezto.sh

read -p "Do you want to install powerline fonts? " yn
case $yn in
    [Yy]* )
        # Install fonts
        git clone https://github.com/powerline/fonts.git "$HOME/fonts"
        ~/fonts/install.sh
        break;;
    [Nn]* )
        ;;
esac

# Set Zsh as the default shell
chsh -s /bin/zsh
