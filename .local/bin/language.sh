#!/bin/sh
# Tiny script for selecting keyboard layout while in X
rtrim (){
 printf '%s\n' "${1%%$2}"
}

# declare delimiter
# delimiter="-"

# declare languages
languages="us - English\nlt - Lithuanian\nru - Russian\nCancel"

# Sending languages to Dmenu
selected=$(echo "$languages" | dmenu)

if test "$selected" != "Cancel" ;then
# Trimming
trimmed="$(rtrim $selected $delimiter)"
setxkbmap $trimmed
fi
