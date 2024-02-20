#!/usr/bin/env bash

export DOTFILES_PATH="$HOME/.dotfiles"
export DOTLY_PATH="$DOTFILES_PATH/modules/dotly"
export DOTLY_THEME="codely"
export PATH="$HOME/bin:$DOTFILES_PATH/bin:$DOTLY_PATH/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

source "$HOME/.bashrc"
