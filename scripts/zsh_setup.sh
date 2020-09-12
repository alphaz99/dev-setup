# Check if zsh is installed
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }

# Install zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# Remove previous zsh configuration
if [ -e ~/.zshrc ] || [ -L ~/.zshrc ]; then mv ~/.zshrc ~/.zshrc_bak; fi
if [ -e ~/.zshenv ] || [ -L ~/.zshenv ]; then mv ~/.zshenv ~/.zshenv_bak; fi

# Symlink new zsh configuration
mkdir -p $HOME/.zsh
ln -s $(pwd)/zsh/.zshrc ~/.zsh/.zshrc
ln -s $(pwd)/zsh/.zshenv_home ~/.zshenv
ln -s $(pwd)/zsh/.zshenv ~/.zsh/.zshenv


# Remove previous zsh configuration
if [ -e ~/.p10k.zsh ] || [ -L ~/.p10k.zsh ]; then mv ~/.p10k.zsh ~/.p10k.zsh; fi

# Symlink powerlevel10k configuration
ln -s $(pwd)/../zsh/.p10k.zsh ~/.zsh/.p10k.zsh

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
