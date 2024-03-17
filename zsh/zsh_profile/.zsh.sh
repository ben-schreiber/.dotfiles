
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"

source "$HOME/.dotfiles/zsh/zsh-highlighting-themes/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh"
plugins=(
	git
	npm
	zsh-autosuggestions
	zsh-syntax-highlighting
    wd
    web-search
    vi-mode
)

source "$ZSH/oh-my-zsh.sh"

# toad_runner_programs=("dbtoad" "ingestoad" "monitoad" "deletoad" "generitoad")
# for prog in ${toad_runner_programs[@]}; do
#   if [ ! -f "$HOME/.$prog-complete.zsh" ]; then
#     declare _${prog:u}_COMPLETE=zsh_source "$prog" > "$HOME/.$prog-complete.zsh"
#   fi
#   . "$HOME/.$prog-complete.zsh"
# done

# eval "$(_DBTOAD_COMPLETE=zsh_source dbtoad)"
# eval "$(_INGESTOAD_COMPLETE=zsh_source ingestoad)"
# eval "$(_MONITOAD_COMPLETE=zsh_source monitoad)"
# eval "$(_DELETOAD_COMPLETE=zsh_source deletoad)"
# eval "$(_GENERITOAD_COMPLETE=zsh_source generitoad)"


