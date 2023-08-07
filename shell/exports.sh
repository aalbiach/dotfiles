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
# Apps
# ------------------------------------------------------------------------------
export SPACESHIP_CONFIG="${DOTFILES_PATH}/shell/zsh/themes/spaceship/conf.zsh"
export JQ_COLORS="0;33:0;35:0;35:0;35:0;32:0;31:0;37"

fzf_colors="pointer:#ebdbb2,bg+:#3c3836,fg:#ebdbb2,fg+:#fbf1c7,hl:#8ec07c,info:#928374,header:#fb4934"
export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"

# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------
#path=(
# "$HOME/bin"
# "$DOTLY_PATH/bin"
# "$DOTFILES_PATH/bin"
# "/usr/local/opt/ruby/bin"
# "/usr/local/opt/python/libexec/bin"
# "/opt/homebrew/bin"
# "$path"
#)

#export path
