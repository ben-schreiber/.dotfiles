install_module() {
    chmod +x "$HOME/.dotfiles/$1/install.sh"
    "$HOME/.dotfiles/$1/install.sh"
}

declare -a modules=("brew" "git" "zsh" "vim" "nvim" "vscode" "iterm")

for module in "${modules[@]}"
do
    echo "Installing module $module"
    sleep 2
    install_module "$module"
done
