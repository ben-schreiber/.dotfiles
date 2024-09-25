# Install brew
sudo true
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(
  echo
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>$HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages
brew install jq font-hack-nerd-font bat
brew install --cask spotify whatsapp alt-tab time-out
brew tap homebrew/cask-fonts

mkdir -p $HOME/.config/bat
ln -sf $HOME/.dotfiles/brew/bat-config $HOME/.config/bat/config
