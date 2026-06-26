#!/usr/bin/env zsh

if [[ -z "$INTELLIJ_ENVIRONMENT_READER" ]]; then
	# Uncomment to profile startup with `zprof`
	# zmodload zsh/zprof

	# ZSH Ops
	setopt HIST_IGNORE_ALL_DUPS # remove older duplicate entries from history
	setopt HIST_FCNTL_LOCK
	setopt +o nomatch
	setopt HIST_REDUCE_BLANKS   # remove superfluous blanks from history items
	setopt INC_APPEND_HISTORY   # save history entries as soon as they are entered
	setopt SHARE_HISTORY        # share history between different instances of the shell
	setopt AUTO_CD              # cd by typing directory name if it's not a command
	#setopt CORRECT_ALL          # autocorrect commands
	setopt AUTO_LIST            # automatically list choices on ambiguous completion
	setopt AUTO_MENU            # automatically use menu completion
	setopt ALWAYS_TO_END        # move cursor to end if word had one match
	setopt AUTO_PUSHD           # push old dir onto stack on cd (enables cd -N)
	setopt PUSHD_IGNORE_DUPS    # no duplicate entries in dir stack
	setopt PUSHD_MINUS          # swap meaning of cd +N / cd -N
	setopt MULTIOS              # pipe to multiple outputs
	setopt INTERACTIVE_COMMENTS # allow # comments in interactive shell
	setopt LONG_LIST_JOBS       # show PID in bg job notifications

	# History config
	HISTFILE=$HOME/.zsh_history
	HISTSIZE=100000
	SAVEHIST=$HISTSIZE

	source "$DOTFILES_PATH/shell/init.sh"

	# Enhanced form of menu completion called `menu selection'
	zmodload -i zsh/complist

	source "$DOTLY_PATH/shell/zsh/bindings/dot.zsh"
	source "$DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh"
	source "$DOTFILES_PATH/shell/zsh/key-bindings.zsh"

	zstyle ':antidote:bundle' use-friendly-names 'yes'

	# Set the name of the static .zsh plugins file antidote will generate.
	zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

	# Ensure you have a .zsh_plugins.txt file where you can add plugins.
	[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

	# Load antidote from its functions directory.
	fpath=("/opt/homebrew/opt/antidote/share/antidote/functions" $fpath)
	autoload -Uz antidote

	# Generate a new static file whenever .zsh_plugins.txt is updated.
	if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
		antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
	fi

	# Source plugins.
	source ${zsh_plugins}.zsh

	# compinit after plugins so fpath additions (zsh-completions, pure) are visible.
	local zcd="${ZDOTDIR:-$HOME}/.zcompdump"
	autoload -Uz compinit
	() {
		setopt extendedglob local_options
		if [[ -n $zcd(#qN.mh+24) ]]; then
			compinit -u -d $zcd
		else
			compinit -C -i -d $zcd
		fi
	}

	# Pure prompt
	autoload -Uz promptinit && promptinit && prompt pure

	# fzf shell integration
	source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
	source "/opt/homebrew/opt/fzf/shell/completion.zsh"

fi

# Added by Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

. "$HOME/.local/bin/env"


# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity IDE
export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"
