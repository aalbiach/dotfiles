#!/usr/bin/env zsh

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$DOTFILES_PATH/bin:$DOTLY_PATH/bin:$PATH"
export PATH="$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts:$PATH"
export PATH="$HOME/bin:$PATH"

[[ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]] && source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"

# SDKMAN configuration
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# remove duplicated entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path
