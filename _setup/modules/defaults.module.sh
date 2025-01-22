# Configure OS defaults

say "Configuring OS"

# Set dock position
defaults write com.apple.dock orientation -string right
# Set dock icon size
defaults write com.apple.dock tilesize -int 36
# Set dock auto hide
defaults write com.apple.dock autohide -bool true
# Hide recently used apps
defaults write com.apple.dock show-recents -bool false
# Minimize to app icon
defaults write com.apple.dock minimize-to-application -bool true
# Restart dock to apply changes
killall Dock

# Show extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Remove old trash
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
# No warning when changing extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Save new documents to disk
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Set #HOME as a target for new Finder window
defaults write com.apple.finder NewWindowTarget -string PfHm
defaults write com.apple.finder NewWindowTargetPath -string file://${HOME}
# Hide all icons on desktop
defaults write com.apple.finder CreateDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
# Disable tags
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder FXTagsInSidebarSuppressionValue -bool true
# Restart finder to apply changes
killall Finder

# Do Nothing on Fn button press
defaults write com.apple.HIToolbox AppleFnUsageType -int 0
# Use F1, F2, etc. as standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
# Enable moving focus with Tab and Shift Tab
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
# Enable moving windows with Ctrl + Cmd pressed
defaults write -g NSWindowShouldDragOnGesture -bool true

# Enable click by tap
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# Enable dragging without a lock
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
# Enable right click
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# Configure two-finger right click
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0

# Enable FireVault if not enabled by default
if [ "$(fdesetup isactive)" != "true" ]; then
  sudo fdesetup enable $(id -un)
fi

# Enable firewall in stealth mode
if ! sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate | grep "enabled" &>/dev/null; then
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
fi

# Enable stealth mode
if ! sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode | grep "on" &>/dev/null; then
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
fi

say "OS configuration is finished. Note that some of these changes require a logout/restart to take effect"
