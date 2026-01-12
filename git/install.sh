# Install git
brew install git

# Install global files
ln -sf "${HOME}/.dotfiles/git/.gitignore_global" "${HOME}/.gitignore_global"
ln -sf "${HOME}/.dotfiles/git/.gitconfig" "${HOME}/.gitconfig"
