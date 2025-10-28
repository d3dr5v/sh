echo "Linking home directory..."

ln -sf ~/@/dot/CykmA/.zshrc ~/
ln -sf ~/@/dot/Oichl/.alacritty.toml ~/
ln -sf ~/@/dot/fEYjd/.gitconfig ~/
ln -sf ~/@/dot/znadS/.tmux.conf ~/

echo "Linking .config directory..."

mkdir -p ~/.config/nix
ln -sf ~/@/dot/3FPMD/nix.conf ~/.config/nix/

mkdir -p ~/.config/nvim
ln -sf ~/@/dot/JhUh7/init.vim ~/.config/nvim/

mkdir -p ~/.config/karabiner
ln -sf ~/@/dot/O7m2A/karabiner.json ~/.config/karabiner/

echo "Linking .vim directory..."

mkdir -p ~/.vim
ln -sf ~/@/dot/dIZ9S/vimrc ~/.vim/

mkdir -p ~/.vim/colors
ln -sf ~/@/vim/77ZHT/bleu.vim ~/.vim/colors/
ln -sf ~/@/vim/FinHi/green.vim ~/.vim/colors/
ln -sf ~/@/vim/SAeMS/purple.vim ~/.vim/colors/
ln -sf ~/@/vim/V4VVM/red.vim ~/.vim/colors/
ln -sf ~/@/vim/VTsW6/white.vim ~/.vim/colors/
ln -sf ~/@/vim/WlSj1/yellow.vim ~/.vim/colors/
