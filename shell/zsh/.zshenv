#!/usr/bin/env zsh

export DOTFILES_PATH="$HOME/.dotfiles"
export DOTLY_PATH="$DOTFILES_PATH/modules/dotly"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"

export PATH="$DOTLY_PATH/bin:$PATH"
export PATH="$DOTFILES_PATH/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
#source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
