# Install nvim
brew install neovim node
curl -sL install-node.now.sh | bash && curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
cd ~ &&	pip install pynvim

# Install COC
mkdir -p ~/.local/share/nvim/site/pack/coc/start
cd ~/.local/share/nvim/site/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
nvim -c "helptags coc.nvim/doc/ | q"

mkdir -p ~/.config/nvim || true
ln -fs ~/.dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -fs ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
