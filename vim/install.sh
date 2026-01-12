# Install vim
brew install vim

# Install vimrc
ln -fs "${HOME}/.dotfiles/vim/.vimrc" "${HOME}/.vimrc"

# Install color schemes
mkdir -p "${HOME}/.vim/colors"
cd "${HOME}/.dotfiles/vim/colors"
for COLOR in *
do
    [ -f "${COLOR}" ] && ln -fs "${HOME}/.dotfiles/vim/colors/${COLOR}" "${HOME}/.vim/colors/${COLOR}"
done

# Install direct packages
mkdir -p "${HOME}/.vim/pack/plugins/start/" && cd "${HOME}/.vim/pack/plugins/start"
git clone https://github.com/ctrlpvim/ctrlp.vim.git ctrlp
git clone https://github.com/itchyny/lightline.vim lightline
git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git Jenkinsfile-vim-syntax

# Vundle
mkdir -p "${HOME}/.vim/bundle"
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall

