brew install --cask cursor 

ln -sf "${HOME}/.dotfiles/cursor/settings.json" "${HOME}/Library/Application Support/Cursor/User/settings.json"
ln -sf "${HOME}/.dotfiles/cursor/keybindings.json" "${HOME}/Library/Application Support/Cursor/User/keybindings.json"

cp "${HOME}/.dotfiles/cursor/save_cursor_extensions.sh" "${HOME}/.dotfiles/.git/hooks/pre-commit"
chmod +x "${HOME}/.dotfiles/.git/hooks/pre-commit"

echo "Installing cursor extensions"
desired_extensions=$(cat "${HOME}/.dotfiles/cursor/extensions.txt")
installed_extensions=$(cursor --list-extensions)
missing_extensions=$(echo ${desired_extensions[@]} ${installed_extensions[@]} | tr ' ' '\n' | sort | uniq -u)
echo ${missing_extensions}
if [ -z "${missing_extensions}" ]
then
    echo "All extensions are already installed"
else
    for extension in ${missing_extensions}; do
        cursor --install-extension ${extension}
    done
fi

