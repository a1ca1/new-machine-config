#!/bin/bash

echo "Starting configuration"

#install homebrew
echo "setting up the brewery"
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#apple silicon only: 
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/apfc/.zprofile

#apple silicon only: 
eval "$(/opt/homebrew/bin/brew shellenv)"


#installing software

echo "Installing tools & apps"
brew install cask
brew install wget
brew install speedtest-cli
brew install fdupes
brew install yt-dlg 
brew install ffmpeg
brew install caffeine
brew install bbedit
brew install alfred
brew install 1password
brew install bettertouchtool
brew install spotify
brew install monitorcontrol
brew install discord
brew install appcleaner
brew install keka
brew install calibre
brew install rectangle
brew tap lotyp/homebrew-formulae
brew install lotyp/formulae/dockutil
brew install --cask tailscale
#brew install firefox
#brew install chrome
#brew install dropbox


#Tweaks

#Disabling system-wide resume
echo "disabling annoying app resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#Allow text selection in Quick Look
echo "enabling quick look text selection"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#Expanding the save/print panel by default
echo "long live big save and print menus"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

#Automatically quit printer app once the print jobs complete
echo "banishing printer app when not printing"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#Saving to disk (not to iCloud) by default
echo "Preventing iCloud Drive confusion"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Showing all filename extensions in Finder by default"
echo "Enabling file extensions always"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#Show path in Finder title bar
echo "enabling path bar titles"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

#Show status bar in Finder by default
echo "enabling status bar always"
defaults write com.apple.finder ShowStatusBar -bool true

#Showing icons for hard drives, servers, and removable media on the desktop
echo "revealing external media on desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#Preventing Time Machine from prompting to use new hard drives as backup volume
echo "stopping time machine from wanting all disks"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Use column view in all Finder windows by default"
echo "setting Column view as default"
defaults write com.apple.finder FXPreferredViewStyle clmv
defaults write AlwaysOpenWindowsInListView -bool false

#"Setting screenshots location to ~/Desktop"
echo "Screenshots to desktop, please"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

#"Setting screenshot format to PNG"
echo "Screenshots as PNGs, please"
defaults write com.apple.screencapture type -string "png"

#Turning off Gatekeeper
echo "I'm the Gatekeeper now"
sudo spctl --master-disable


echo "Relaunching Finder"
killall Finder


echo "Configuring dock"
echo "wiping the slate clean"

dockutil --remove all

echo "adding apps to dock"

dockutil --add /System/Applications/System\ Settings.app
dockutil --add /Applications/Google\ Chrome.app
dockutil --add /Applications/Slack.app
dockutil --add /Applications/Microsoft\ Outlook.app
dockutil --add /Applications/zoom.us.app
dockutil --add /Applications/Firefox.app
dockutil --add /System/Applications/Calendar.app
dockutil --add /System/Applications/Notes.app
dockutil --add /System/Applications/Reminders.app
dockutil --add /System/Applications/Messages.app
#dockutil --add /Applications/calibre.app
#dockutil --add /Applications/Discord.app
#dockutil --add /Applications/1Password.app


echo "adding folders to dock"

dockutil --add ~/Documents
dockutil --add ~/Downloads

killall Dock

echo "Done!"

