brew install --cask visual-studio-code 

ln -sf "${HOME}/.dotfiles/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sf "${HOME}/.dotfiles/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"

cp "${HOME}/.dotfiles/vscode/save_vscode_extensions.sh" "${HOME}/.dotfiles/.git/hooks/pre-commit"
chmod +x "${HOME}/.dotfiles/.git/hooks/pre-commit"

echo "Installing vscode extensions"
desired_extensions=$(cat "${HOME}/.dotfiles/vscode/extensions.txt")
installed_extensions=$(code --list-extensions)
missing_extensions=$(echo ${desired_extensions[@]} ${installed_extensions[@]} | tr ' ' '\n' | sort | uniq -u)
echo ${missing_extensions}
if [ -z "${missing_extensions}" ]
then
    echo "All extensions are already installed"
else
    for extension in ${missing_extensions}; do
        code --install-extension ${extension}
    done
fi

