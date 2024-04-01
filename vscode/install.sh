brew install --cask visual-studio-code 

ln -sf ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/.dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

cp ~/.dotfiles/vscode/save_vscode_extensions.sh ~/.dotfiles/.git/hooks/pre-commit
chmod +x ~/.dotfiles/.git/hooks/pre-commit

echo "Installing vscode extensions"
desired_extensions=$(cat ~/.dotfiles/vscode/extensions.txt)
installed_extensions=$(code --list-extensions)
missing_extensions=$(echo ${desired_extensions[@]} ${installed_extensions[@]} | tr ' ' '\n' | sort | uniq -u)
echo $missing_extensions
if [ -z "${missing_extensions}" ]
then
    echo "All extensions are already installed"
else
    for extension in $missing_extensions; do
        code --install-extension $extension
    done
fi

