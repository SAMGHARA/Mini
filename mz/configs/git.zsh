# Git
RESET="%Creset"
HASH="%C(yellow)%h"
DATE="%C(magenta)%cd"
AUTHOR="%C(blue)%cn"
COMMIT="%C(white)%s"

DateFormat="%Y-%m-%d %H:%M"
PrettyFormat="${HASH} ${DATE} ${AUTHOR}: ${COMMIT} ${RESET}"

typeset -A gitAlias=(
    gtu    "git status"
    gta    "git stash"
    gl     "git log --graph --color=always --date=format:'${DateFormat}' --pretty=format:'${PrettyFormat}'"
)
addAlias gitAlias

# --------------- TODO: robust -----------------
# git clone
function gc() {
    case $1 {
        (-r) git clone --recursive $2 ;;
        (*)  git clone $1 ;;
    }
}

# git commit
function gm() {
    case $1 {
        (-m) git commit -m $2 ;;
        (-a) git commit --amend ;;
        (-e) git commit --amend --edit ;;
        (*)  git commit ;;
    }
}

