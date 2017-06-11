#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update
brew install caskroom/cask/brew-cask

brew tap caskroom/drivers
brew cask install wacom-intuos-tablet
brew cask install wacom-bamboo-tablet

brew cask install --appdir="/Applications" adobe-photoshop-cs6
brew cask install --appdir="/Applications" blender
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" clip-studio-paint

# Remove outdated versions from the cellar.
brew cleanup
