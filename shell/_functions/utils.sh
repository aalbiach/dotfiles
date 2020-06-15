# preview csv files. source: http://stackoverflow.com/questions/1875305/command-line-csv-viewer
function csvpreview(){
  sed 's/,,/, ,/g;s/,,/, ,/g' "$@" | column -s, -t | less -#2 -N -S
}

# who is using the laptop's iSight camera?
camerausedby() {
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
  fi;
}

function i() {
  if [[ $# -eq 0 ]]; then
    idea .;
  else
    idea "$@";
  fi;
}

function c() {
  if [[ $# -eq 0 ]]; then
    idea .;
  else
    idea "$@";
  fi;
}

# direct it all to /dev/null
function nullify() {
  "$@" >/dev/null 2>&1
}
