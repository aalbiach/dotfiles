#!/usr/bin/env zsh

# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

# https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2

# ########################
# Environment variables  #
# ########################

# Set visual editor and default editor
export VISUAL='code -w'
export EDITOR='micro'
export PAGER=less
# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

export DOTFILES_PATH="$HOME/.dotfiles"
export DOTLY_PATH="$DOTFILES_PATH/modules/dotly"
export ZDOTDIR=$DOTFILES_PATH/shell/zsh

# Machine-local secrets (not tracked by git)
[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
