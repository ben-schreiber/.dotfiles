install_module() {
    chmod +x ~/.dotfiles/$1/install.sh
    ~/.dotfiles/$1/install.sh
}

declare -a modules=("brew" "git" "zsh" "kitty" "vim" "nvim" "vscode")

for module in "${modules[@]}"
do
    echo "Installing module $module"
    sleep 2
    install_module "$module"
done
