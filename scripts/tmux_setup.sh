# Check if zsh is installed
command -v tmux >/dev/null 2>&1 || { echo >&2 "I require tmux but it's not installed.  Aborting."; exit 1; }

# Remove previous tmux configuration
if [ -e ~/.tmux.conf ] || [ -L ~/.tmux.conf ]; then mv ~/.tmux.conf ~/.tmux.conf_bak; fi

# Symlink new tmux configuration
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
