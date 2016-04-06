# Clone the prezto repo
git clone --recursive https://github.com/alphaz99/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Remove previous zsh configuration
rm ~/.zshrc

# Install prezto
zsh install_prezto.sh

# Install fonts
git clone https://github.com/powerline/fonts.git "$HOME/fonts"
~/fonts/install.sh

# Set Zsh as the default shell
chsh -s /bin/zsh
