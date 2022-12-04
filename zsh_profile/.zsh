
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"
# ZSH_THEME="robbyrussell"
source ~/.dotfiles/zsh-highlighting-themes/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh
plugins=(
	git
	npm
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
