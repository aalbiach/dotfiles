# Enable aliases to be sudo’ed
alias sudo='sudo '

# alias ..="cd .."
# alias ...="cd ../.."
# alias ll="ls -l"
# alias la="ls -la"
# alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -I'
alias cp='cp -v'

# Git
# alias gaa="git add -A"
# alias gc='$DOTLY_PATH/bin/dot git commit'
# alias gca="git add --all && git commit --amend --no-edit"
# alias gco="git checkout"
# alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
# alias gs="git status -sb"
# alias gf="git fetch --all -p"
# alias gps="git push"
# alias gpsf="git push --force"
# alias gpl="git pull --rebase --autostash"
# alias gb="git branch"
# alias gl='$DOTLY_PATH/bin/dot git pretty-log'

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='open .'
alias up='dot package update_all'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

alias zshconfig="micro ~/.zshrc"

alias chmox='chmod -x'

alias where=which # sometimes i forget

alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD.
# Then clear the useless sleepimage
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash=" \
		sudo rm -rfv /Volumes/*/.Trashes; \
		rm -rfv ~/.Trash/*; \
		sudo rm -v /private/var/vm/sleepimage; \
		sudo rm -rfv /private/var/log/asl/*.asl; \
		sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent' \
"

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle; brew cleanup; brew doctor"
alias update_brew_npm='brew_update; npm install npm -g; npm update -g'


alias localip="ipconfig getifaddr en0"

# Show active network interfaces
# alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"


# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"


# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
