# Git
CommitHash="%C(yellow)%h"
CommitDate="%C(magenta)%cd"
CommitAuthor="%C(blue)%cn"
CommitMessage="%C(white)%s"
ColorReset="%Creset"

DateFormat="%Y-%m-%d %H:%M"
PrettyFormat="${CommitHash} ${CommitDate} ${CommitAuthor}: ${CommitMessage} ${ColorReset}"

typeset -A gitAlias=(
    gtus        "git status"
    gtash       "git stash save"
    glog        "git log --graph --date=format:'${DateFormat}' --pretty=format:'${PrettyFormat}'"
    gclone      "git clone --recursive"
    gcommit     "git commit"
)
addAlias gitAlias
