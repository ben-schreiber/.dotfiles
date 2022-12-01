

brew:
	brew_install
	brew_packages
	brew_cask_packages

brew_install:
	sudo true;
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash;
	
brew_packages:
	brew install pyenv pyenv-virtualenv git vim neovim jq node

brew_cask_packages:
	brew install --cask iterm2 spotify whatsapp alt-tab font-fira-code


vim:
	vim_prequisites
	vim_github

vim_prequisites:
	curl -sL install-node.now.sh | bash && curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
	cd ~ &&	pip install pynvim

vim_github:
	# Install Direct Packages
	mkdir -p ~/.vim/pack/plugins/start/ && cd ~/.vim/pack/plugins/start
	mkdir ctrlp
	git clone https://github.com/ctrlpvim/ctrlp.vim.git ./ctrlp
	mkdir lightline
	git clone https://github.com/itchyny/lightline.vim ./lightline
	mkdir Jenkins-vim-syntax
	git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git ./Jenkinsfile-vim-syntax
	# Install COC
	mkdir -p ~/.local/share/nvim/site/pack/coc/start
	cd ~/.local/share/nvim/site/pack/coc/start
	git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
	nvim -c "helptags coc.nvim/doc/ | q"
