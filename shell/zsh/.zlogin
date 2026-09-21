#!/usr/bin/env zsh

# Execute code in the background to not affect the current session
(
	# <https://github.com/zimfw/zimfw/blob/master/login_init.zsh>
	setopt LOCAL_OPTIONS EXTENDED_GLOB NULL_GLOB
	autoload -U zrecompile
	local zdotdir="${ZDOTDIR:-$HOME}"

	# If ZSH was upgraded, stale .zwc files cause "wrong version" warnings.
	# Wipe them so zrecompile starts clean.
	local version_stamp="$zdotdir/.zsh_compiled_version"
	if [[ "$(< "$version_stamp" 2>/dev/null)" != "$ZSH_VERSION" ]]; then
		rm -f "$zdotdir"/*.zwc "$zdotdir"/*.zwc.old
		echo "$ZSH_VERSION" >| "$version_stamp"
	fi

	# Compile zcompdump, if modified, to increase startup speed.
	local zcompdump="$zdotdir/.zcompdump"
	if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
		zrecompile -pq "$zcompdump"
	fi

	# Compile config files and the antidote-generated plugins file.
	zrecompile -pq "$zdotdir/.zshrc"
	zrecompile -pq "$zdotdir/.zshenv"
	zrecompile -pq "$zdotdir/.zprofile"
	zrecompile -pq "$zdotdir/.zsh_plugins.zsh"

	rm -f "$zdotdir"/*.zwc.old
) &!
