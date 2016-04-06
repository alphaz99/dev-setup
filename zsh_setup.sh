# Start the Zsh shell
zsh

# Clone the prezto repo
git clone --recursive https://github.com/alphaz99/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Copy the configuration files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

# Set Zsh as the default shell
chsh -s /bin/zsh
