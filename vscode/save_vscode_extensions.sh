#!/bin/zsh

dotfiles_dir="$HOME"/.dotfiles
if [ "$PWD" = "$dotfiles_dir" ]; then
  code --list-extensions > "$HOME/.dotfiles/vscode/extensions.txt"
  git add vscode/extensions.txt
else
    echo "$PWD"
fi
