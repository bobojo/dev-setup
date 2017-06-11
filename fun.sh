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
brew cask install game-capture-hd
brew cask install --appdir="/Applications" discord
brew cask install --appdir="/Applications" obs

# Media players
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" plex-media-player

# Game dev
brew cask install --appdir="/Applications" unity
brew cask install --appdir="/Applications" unity-web-player
brew cask install --appdir="/Applications" renpy

# Install game applications (naughty)
brew cask install --appdir="/Applications" steam
brew cask install --appdir="/Applications" dolphin
brew cask install --appdir="/Applications" openemu
brew cask install --appdir="/Applications" battle-net
brew cask install --appdir="/Applications" itch

# Remove outdated versions from the cellar.
brew cleanup
