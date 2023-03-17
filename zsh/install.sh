# Install oh-my-zsh
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -c

# Install plugins
mkdir -p ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install theme
mkdir -p ~/.oh-my-zsh/custom/themes
ln -fs ~/.dotfiles/mytheme.zsh-theme ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme

# Install zsrc
ln -fs ~/.dotfiles/zsh/.zshrc ~/.zshrc

brew install pyenv pyenv-virtualenv
