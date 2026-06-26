#!/usr/bin/env zsh

local _garmin_cfg="$HOME/Library/Application Support/Garmin/ConnectIQ/current-sdk.cfg"
[[ -f "$_garmin_cfg" ]] && export PATH="$(< "$_garmin_cfg")/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$DOTFILES_PATH/bin:$DOTLY_PATH/bin:$PATH"
export PATH="$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts:$PATH"
export PATH="$HOME/bin:$PATH"

# SDKMAN — lazy-loaded on first `sdk` call to avoid ~1s startup cost
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
  unfunction sdk
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}

# remove duplicated entries from $PATH
# zsh uses $path array along with $PATH
#typeset -U PATH path


# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"
