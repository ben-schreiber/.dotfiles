
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"

source "$HOME/.dotfiles/zsh/zsh-highlighting-themes/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh"
plugins=(
	git
	npm
	zsh-autosuggestions
	zsh-syntax-highlighting
    wd
)

source "$ZSH/oh-my-zsh.sh"
