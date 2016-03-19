#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@" #check for sudo

# install Xcode dev tools
open -a safari https://developer.apple.com/xcode/download/
xcode-select --install
while true; do
	read -p "Do you installed Xcode & Xcode tools completely ?" yn
	case $yn in
		[Yy]* ) exit;;
		[Nn]* ) continue;;
	* ) echo "Please answer yes or no.";;
esac
done




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


# install wget
brew install wget

#system install script
export TMPDIR=~/tmp
mkdir ~/.tmpinstall
cd ~/.tmpinstall

# install xca
curl -L http://downloads.sourceforge.net/project/xca/xca/1.3.2/xca-1.3.2.dmg > xca.dmg
sudo hdiutil attach xca.dmg
cp -r /Volumes/`ls /Volumes/ | grep xca`/xca.app /Applications
sudo hdiutil detach /Volumes/`ls /Volumes/ | grep xca`


# install sublimeText
curl -L https://download.sublimetext.com/Sublime%20Text%20Build%203103.dmg > Sublime.dmg
sudo hdiutil attach Sublime.dmg
cp -r /Volumes/Sublime\ Text/Sublime\ Text.app/ /Applications/
sudo hdiutil detach Sublime.dmg



# install dropbox
curl -L https://www.dropbox.com/download?plat=mac > dropbox.dmg
sudo hdiutil attach dropbox.dmg
open /Volumes/Dropbox\ Installer/Dropbox.app/
while true; do
	read -p "Do you installed dropbox completely ?" yn
	case $yn in
		[Yy]* ) sudo hdiutil detach dropbox.dmg; exit;;
		[Nn]* ) continue;;
	* ) echo "Please answer yes or no.";;
esac
done
#install sourcetree
curl -L -# https://downloads.atlassian.com/software/sourcetree/SourceTree_2.2.3.dmg > sourcetree.dmg
hdiutil attach sourcetree.dmg 
ArchiveName=`ls /Volumes/ | grep -i sourcetree`
AppName=/Volumes/$ArchiveName/`ls /Volumes/$ArchiveName | grep -i .app`
cp -r $AppName ~/Applications/
hdiutil detach /Volumes/$ArchiveName



#install chrome


#install 


#final 
rm -rf ~/.tmpinstall