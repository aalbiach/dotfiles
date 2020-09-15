# Installation Guide

## On a new MacOS (migrating from another)
* Log in iCloud and Sync all Keychain passwords
* Update Mac 
* Backup `~/.ssh` and `~/.gnupg` from the previous computer to the new one
  - `chmod -R 700 ~/.ssh`
  - `chmod -R 700 ~/.gnupg`
* Execute the dotfiles installer
* Login in Google Chrome
#* Go to `Preferences/Keyboard/Shortcuts` and disable everything
* Go to `Preferences/General` and enable font smoothing (if retina display)
* Open JetBrains Toolbox and login
  - Login
  - Enable "generate shell scripts in ~/bin"
  - Install IntelliJ
* Open IntelliJ
  - Import from JetBrains account
  - Sync plugins
  - Execute `dot intellij add_code_templates`
* Open Spotify
  - Set streaming quality to very high
  - Disable automatic startup
* Open iTerm
  - Select load preferences from URL and use ~/.dotfiles/os/mac/iTerm2. On the next prompt select "NOT copy"
* Restart
* Execute `dot shell zsh reload_completions` and then `compinit`
