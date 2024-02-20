#!/usr/bin/env zsh

if [[ -z "$INTELLIJ_ENVIRONMENT_READER" ]]; then
	# Uncomment for debug with `zprof`
	zmodload zsh/zprof

	# ZSH Ops
	setopt HIST_IGNORE_ALL_DUPS # remove older duplicate entries from history
	setopt HIST_FCNTL_LOCK
	setopt +o nomatch
	# setopt autopushd
	setopt HIST_REDUCE_BLANKS   # remove superfluous blanks from history items
	setopt INC_APPEND_HISTORY   # save history entries as soon as they are entered
	setopt SHARE_HISTORY        # share history between different instances of the shell
	setopt AUTO_CD              # cd by typing directory name if it's not a command
	#setopt CORRECT_ALL          # autocorrect commands
	setopt AUTO_LIST            # automatically list choices on ambiguous completion
	setopt AUTO_MENU            # automatically use menu completion
	setopt ALWAYS_TO_END        # move cursor to end if word had one match

	#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

	# Async mode for autocompletion
	#ZSH_AUTOSUGGEST_USE_ASYNC=true
	#ZSH_HIGHLIGHT_MAXLENGTH=300
	ZSH_THEME="spaceship"

	# History config
	HISTFILE=$HOME/.zsh_history
	HISTSIZE=100000
	SAVEHIST=$HISTSIZE

	source "$DOTFILES_PATH/shell/init.sh"

#	fpath=(
#		"$DOTFILES_PATH/shell/zsh/themes"
#		"$DOTFILES_PATH/shell/zsh/completions"
#	#  "$DOTLY_PATH/shell/zsh/themes"
#		"$DOTLY_PATH/shell/zsh/completions"
#		"$(brew --prefix)/share/zsh/site-functions"
#		$fpath
#	)

	# Load all stock functions (from $fpath files) called below.
	autoload -Uz compinit

	local zcd="${ZDOTDIR:-$HOME}/.zcompdump"  # zcompdump

	() {
		setopt extendedglob local_options

		if [[ -n $zcd(#qN.mh+24) ]]; then
		 if [[ $ZSH_DISABLE_COMPFIX == 'true' ]]; then
					compinit -C -u -d $zcd
				else
					compinit -u -d $zcd
				fi
			else
				if [[ $ZSH_DISABLE_COMPFIX == 'true' ]]; then
					compinit -C -i -d $zcd
				else
					compinit -i -d $zcd
				fi
		fi
	}

	# Enhanced form of menu completion called `menu selection'
	zmodload -i zsh/complist

	source "$DOTLY_PATH/shell/zsh/bindings/dot.zsh"
	source "$DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh"
	source "$DOTFILES_PATH/shell/zsh/key-bindings.zsh"

	# Start Antidote
	source <(antidote init)

	# Set the name of the static .zsh plugins file antidote will generate.
	zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh

	# Ensure you have a .zsh_plugins.txt file where you can add plugins.
	[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

	# Lazy-load antidote.
	fpath+=(${ZDOTDIR:-~}/.antidote)
	autoload -Uz $fpath[-1]/

	# Generate static file in a subshell when .zsh_plugins.txt is updated.
	if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
		(
			source "/opt/homebrew/opt/antidote/share/antidote/antidote.zsh"
			antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins
		)
	fi

	# Source your static plugins file.
	source $zsh_plugins

#  source "$DOTFILES_PATH/shell/zsh/themes/$ZSH_THEME/conf.zsh"

	autoload -U promptinit && promptinit


	# Uncomment the following line to use case-sensitive completion.
	# CASE_SENSITIVE="true"

	# Uncomment the following line to use hyphen-insensitive completion.
	# Case-sensitive completion must be off. _ and - will be interchangeable.
	# HYPHEN_INSENSITIVE="true"

	# Uncomment the following line if pasting URLs and other text is messed up.
	# DISABLE_MAGIC_FUNCTIONS=true

	# Uncomment the following line to disable colors in ls.
	# DISABLE_LS_COLORS="true"

	# Uncomment the following line to disable auto-setting terminal title.
	# DISABLE_AUTO_TITLE="true"

	# Uncomment the following line to enable command auto-correction.
	# ENABLE_CORRECTION="true"

	# Uncomment the following line to display red dots whilst waiting for completion.
	COMPLETION_WAITING_DOTS="true"

	# Uncomment the following line if you want to disable marking untracked files
	# under VCS as dirty. This makes repository status check for large repositories
	# much, much faster.
	# DISABLE_UNTRACKED_FILES_DIRTY="true"

	# Uncomment the following line if you want to change the command execution time
	# stamp shown in the history command output.
	# You can set one of the optional three formats:
	# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
	# or set a custom format using the strftime function format specifications,
	# see 'man strftime' for details.
	# HIST_STAMPS="mm/dd/yyyy"

	# iTerm2 Shell Integration
	[[ -f "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"

	[[ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]] && source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
	[[ -f "$(brew --prefix)/opt/liquibase/libexec/lib/liquibase_autocomplete_mac.bash" ]] && source "$(brew --prefix)/opt/liquibase/libexec/lib/liquibase_autocomplete.zsh"
fi
