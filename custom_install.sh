#!/bin/bash

apt-get update # get the latest package list

#install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null

# install nodejs 
brew install node --with-full-icu

# install ionic & cordova
npm install -g cordova ionic


#system install script