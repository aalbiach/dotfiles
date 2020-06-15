export PATH=$PATH:$HOME/bin:$DOTFILES_PATH/bin:$DOTLY_PATH/bin:/usr/local/opt/gettext/bin
export PATH=$PATH:/usr/local/opt/gettext/bin
export PATH=$PATH:/usr/local/sbin

# Set visual editor and default editor
export VISUAL='code -w'
export EDITOR='micro'

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_BUNDLE_FILE_PATH="${DOTFILES_PATH}/os/mac/brew/Brewfile"

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# Prefer US English and use UTF-8
# export LC_ALL="en_US.UTF-8"
# export LANG="en_US"

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
# command -v gdircolors >/dev/null 2>&1 || alias gdircolors="dircolors"
# eval "$(gdircolors -b ~/.dircolors)"



# SDKMAN
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
