#!/bin/zsh

dotfiles_dir="${HOME}"/.dotfiles
if [ "${PWD}" = "${dotfiles_dir}" ]; then
  cursor --list-extensions > "${HOME}/.dotfiles/cursor/extensions.txt"
  git add cursor/extensions.txt
else
    echo "${PWD}"
fi
