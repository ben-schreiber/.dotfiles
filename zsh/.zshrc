for DOTFILE in `find $HOME/.dotfiles/zsh/zsh_profile`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done
