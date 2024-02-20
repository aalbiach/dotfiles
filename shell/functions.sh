# ------------------------------------------------------------------------------
# Directories
# ------------------------------------------------------------------------------
function cdd() {
	cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function j() {
	fname=$(declare -f -F _z)

	[ -n "$fname" ] || source "$DOTLY_PATH/modules/z/z.sh"

	_z "$1"
}

function recent_dirs() {
	# This script depends on pushd. It works better with autopush enabled in ZSH
	escaped_home=$(echo $HOME | sed 's/\//\\\//g')
	selected=$(dirs -p | sort -u | fzf)

	cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_" || exit
}

# ------------------------------------------------------------------------------
# Utils
# ------------------------------------------------------------------------------
# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null >/dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ $# -gt 0 ]]; then
		du ${arg} -- "$@"
	else
		du ${arg} .[^.]* ./*
	fi
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}

# Copy w/ progress
function cp_p() {
	rsync -WavP --human-readable --progress "$1" "$2"
}

# preview csv files. source: http://stackoverflow.com/questions/1875305/command-line-csv-viewer
function csvpreview() {
	sed 's/,,/, ,/g;s/,,/, ,/g' "$@" | column -s, -t | less -#2 -N -S
}

# who is using the laptop's iSight camera?
function camerausedby() {
	echo "Checking to see who is using the iSight camera… 📷"
	usedby=$(lsof | grep -w "AppleCamera\|USBVDC\|iSight" | awk '{printf $2"\n"}' | xargs ps)
	echo -e "Recent camera uses:\n$usedby"
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [[ $# -eq 0 ]]; then
		open .;
	else
		open "$@";
	fi
}

function i() {
	if [[ $# -eq 0 ]]; then
		idea .;
	else
		idea "$@";
	fi
}

function c() {
	if [[ $# -eq 0 ]]; then
		code .;
	else
		code "$@";
	fi
}

# direct it all to /dev/null
function nullify() {
	"$@" >/dev/null 2>&1
}

function hr() {
	printf '%*s\n' "${1:-$COLUMNS}" | tr ' ' "${2:-#}"
}

function maven() {
	if command -v ./mvnw &>/dev/null; then
		./mvnw "$@"
	elif command -v mvn &>/dev/null; then
		mvn "$@"
	else
		echo "command not found: mvn"
	fi
}

function gradle() {
	if command -v ./gradlew &>/dev/null; then
		./gradlew "$@"
	elif command -v gradle &>/dev/null; then
		gradle "$@"
	else
		echo "command not found: gradle"
	fi
}

# Print listening ports
function listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}
