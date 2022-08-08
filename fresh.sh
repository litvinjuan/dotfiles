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
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Copy global .gitignore and tell git to use it
ln -s $DOTFILES/.gitignore $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
pecl install imagick redis swoole

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer

# Install Laravel Valet
# $HOME/.composer/vendor/bin/valet install

# Install Global Ray
# $HOME/.composer/vendor/bin/global-ray install

# Create a projects directory
mkdir $HOME/projects

# Create sites subdirectories
mkdir $HOME/projects/apps
mkdir $HOME/projects/freelance
mkdir $HOME/projects/accrue

# Clone Github repositories
$DOTFILES/clone.sh

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macosk
