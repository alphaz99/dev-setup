# Check if zsh is installed
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }

# Clone the prezto repo
git clone --recursive https://github.com/alphaz99/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Remove previous zsh configuration
if [ -e ~/.zshrc ] || [ -L ~/.zshrc ]; then mv ~/.zshrc ~/.zshrc_bak; fi

# Install prezto
zsh install_prezto.sh

# Install powerline fonts
read -p "Do you want to install powerline fonts?[yYnN] " yn
case $yn in
    [Yy]* )
        # Install fonts
        git clone https://github.com/powerline/fonts.git "$HOME/fonts"
        ~/fonts/install.sh
        echo "Fonts successfully installed"
        echo "Please change your shell font"
        break;;
    [Nn]* )
        ;;
esac

# Set Zsh as the default shell
chsh -s /bin/zsh
