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

# Back-end
brew install php70 php70-xdebug
sudo brew install nginx
brew install composer
composer global require "laravel/installer"

# Front-end
brew install node

# Remove outdated versions from the cellar.
brew cleanup

npm install -g coffee-script
# npm install -g grunt-cli
npm install -g gulp
npm install -g gulp-cli
npm install -g jshint
npm install -g less

#gem install jekyll

# CMS utilities
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
composer global require drush/drush
composer global update
curl https://drupalconsole.com/installer -L -o drupal.phar
mv drupal.phar /usr/local/bin/drupal
chmod +x /usr/local/bin/drupal
drupal self-update
