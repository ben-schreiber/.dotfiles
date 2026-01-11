# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
PLUGINS=${HOME}/.oh-my-zsh/custom/plugins
mkdir -p ${PLUGINS} || true
rm -rf ${PLUGINS}/zsh-autosuggestions/
git clone https://github.com/zsh-users/zsh-autosuggestions --depth=1 ${PLUGINS}/zsh-autosuggestions
rm -rf ${PLUGINS}/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git --depth=1 ${PLUGINS}/zsh-syntax-highlighting

# Install theme
mkdir -p ~/.oh-my-zsh/custom/themes || true
ln -fs ~/.dotfiles/zsh/mytheme.zsh-theme ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme

# Install zsrc
ln -fs ~/.dotfiles/zsh/.zshrc ~/.zshrc

brew install pyenv pyenv-virtualenv
