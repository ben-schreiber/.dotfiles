install_module() {
    chmod +x "${HOME}/.dotfiles/$1/install.sh"
    "${HOME}/.dotfiles/$1/install.sh"
}

declare -a modules=("brew" "cursor" "git" "iterm" "vim" "vscode" "zsh")

for module in "${modules[@]}"
do
    echo "Installing module ${module}"
    sleep 2
    install_module "${module}"
done
