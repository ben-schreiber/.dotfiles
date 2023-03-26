brew install --cask kitty
ln -fs ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf


for theme_file in ~/.dotfiles/kitty/themes; do
    ln -sf ~/.dotfiles/kitty/themes/$theme_file ~/.config/kitty/$theme_file
done

kitty +kitten themes --reload-in=all Rosé Pine Moon
