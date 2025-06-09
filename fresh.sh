#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

rm -rf $HOME/.ssh/config
touch $HOME/.ssh/config-local
ln -sw $HOME/.dotfiles/ssh-config $HOME/.ssh/config

# Update Homebrew recipes
brew update

# Install all our brew dependences
./brew.sh

# Create a projects directories
mkdir -p $HOME/dev
mkdir -p $HOME/dev/fpg

# Configure global .gitignore
ln -s $DOTFILES/.gitignore_global $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore
git config --global user.name "Juan Litvin"
git config --global user.email "litvinjuan@gmail.com"
git config --global core.editor "nano"

# Install laravel installer globally
composer global require laravel/installer

# Install Rosetta
sudo softwareupdate --install-rosetta

# Symlink the Mackup config file to the home directory
#ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos