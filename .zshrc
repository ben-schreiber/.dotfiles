for DOTFILE in `find /Users/Ben.schreiber/.dotfiles/zsh_profile`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done
