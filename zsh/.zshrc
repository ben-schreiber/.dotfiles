# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
for DOTFILE in `find $HOME/.dotfiles/zsh/zsh_profile`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done
