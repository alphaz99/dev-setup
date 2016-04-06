# Start the Zsh shell
zsh

# Clone the prezto repo
git clone --recursive https://github.com/alphaz99/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Install prezto
zsh install_prezto.sh

# Set Zsh as the default shell
chsh -s /bin/zsh
