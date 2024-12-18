#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
#~/.dotfiles/apps.sh

# Set global gitignore
git config --global core.excludesfile ~/.dotfiles/.gitignore_global

# Install PHP extensions with PECL
#pecl install imagick redis swoole

# Install global Composer packages
composer global require laravel/installer

# Create a projects directory
mkdir $HOME/projects

# Create sites subdirectories
mkdir $HOME/projects/apps
mkdir $HOME/projects/freelance
mkdir $HOME/projects/accrue

# Clone Github repositories
~/.dotfiles/clone.sh

# Symlink the Mackup config file to the home directory
ln -s ~/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ~/.dotfiles/.macos
