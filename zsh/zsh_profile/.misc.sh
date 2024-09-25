export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:$HOME/.docker/bin

bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
