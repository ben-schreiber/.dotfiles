# Install vim
brew install vim

# Install vimrc
ln -fs ~/.dotfiles/vim/.vimrc ~/.vimrc

# Install color schemes
mkdir -p ~/.vim/colors
cd ~/.dotfiles/vim/colors
for COLOR in *
do
    [ -f "$COLOR" ] && ln -fs ~/.dotfiles/vim/colors/"$COLOR" ~/.vim/colors/"$COLOR"
done

# Install direct packages
mkdir -p ~/.vim/pack/plugins/start/ && cd ~/.vim/pack/plugins/start
git clone https://github.com/ctrlpvim/ctrlp.vim.git ctrlp
git clone https://github.com/itchyny/lightline.vim lightline
git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git Jenkinsfile-vim-syntax

# Vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

