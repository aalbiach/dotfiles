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

# ------------------------------------------------------------------------------
# Languages
# ------------------------------------------------------------------------------
# export JAVA_HOME='/Library/Java/JavaVirtualMachines/amazon-corretto-15.jdk/Contents/Home'
# export GEM_HOME="$HOME/.gem"
# export GOPATH="$HOME/.go"

# ------------------------------------------------------------------------------
# Apps
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------
export path=(
  "$HOME/bin"
  "$DOTLY_PATH/bin"
  "$DOTFILES_PATH/bin"
  "$JAVA_HOME/bin"
#  "$GEM_HOME/bin"
#  "$GOPATH/bin"
#  "$HOME/.cargo/bin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/opt/python/libexec/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/usr/sbin"
  "/bin"
  "/sbin"
)
