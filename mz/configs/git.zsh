# Git
RESET="%Creset"
HASH="%C(yellow)%h"
DATE="%C(magenta)%cd"
AUTHOR="%C(blue)%cn"
COMMIT="%C(white)%s"

DateFormat="%Y-%m-%d %H:%M"
PrettyFormat="${HASH} ${DATE} ${AUTHOR}: ${COMMIT} ${RESET}"

alias g=git

# fzf - git commit browser with previews
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

function gl() {
    git log --graph --color=always --date=format:"${DateFormat}" --pretty=format:"${PrettyFormat}" | \
        fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" \
        --bind "enter:execute:$_viewGitLogLine | less -R"
}

