#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@" #check for sudo


apt-get update # get the latest package list

#install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null

# install nodejs 
brew install node --with-full-icu

# install ionic & cordova
npm install -g cordova ionic

#install cocoapods
sudo gem cleanup
sudo gem install cocoapods

#install fastlane stack
xcode-select --install
sudo gem install fastlane --verbose
sudo gem install deliver snapshot frameit sigh pem cert scan gym match pilot

#system install script
