#!/bin/bash

# OSX Biased Defaults

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# SYSTEM
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Hide battery life percentage.
defaults write com.apple.menuextra.battery ShowPercent -string "NO"

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal



# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# KEYBOARD & TRACKPAD
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null



# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# FINDER
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Hide Desktop icons by default
defaults write com.apple.finder CreateDesktop -bool false

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Use AirDrop over every interface.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Always open new finder windows at Desktop
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true



# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# SCREENSHOTS
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Hide all desktop icons
defaults write com.apple.finder CreateDesktop -bool false

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true



# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# DOCK
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Wipe all icons from dock
defaults write com.apple.dock persistent-apps -array ""
defaults write com.apple.dock persistent-others -array ""

# Make hidden applications have a translucent icon
defaults write com.apple.dock showhidden -bool true


# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# SPACES
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false



# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# APPS
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

# iTerm: Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Chrome: Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

# Chrome: Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
