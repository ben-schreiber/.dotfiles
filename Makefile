

brew:
	brew_install
	brew_packages
	brew_cask_packages

brew_install:
	sudo true;
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash;
	
brew_packages:
	brew install pyenv pyenv-virtualenv git vim neovim jq

brew_cask_packages:
	brew install --cask iterm2 spotify whatsapp alt-tab font-fira-code
