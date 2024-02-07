########### fzf    https://github.com/junegunn/fzf
export FZF_COMPLETION_TRIGGER="\\"
export FZF_DEFAULT_OPTS="
    --color bg+:#3E4452,border:#3E4452
    --bind 'alt-j:down'
    --bind 'alt-k:up'
    --bind 'tab:accept'
    --bind 'ctrl-j:preview-down'
    --bind 'ctrl-k:preview-up'
    --bind 'alt--:change-preview-window()'
    --bind 'alt-=:change-preview-window(right,99%)'
"

###########
# https://github.com/wfxr/forgit
# https://github.com/junegunn/fzf/wiki/Examples
#
# pacman install package
function install() {
    pacman -Slq | fzf -q "$1" -m --preview 'pacman -Si {1}'| xargs -ro sudo pacman -S
}

# pacman uninstall package
function uninstall() {
    pacman -Qq | fzf -q "$1" -m --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
}

function GIT_INSIDE_WORK_TREE() { git rev-parse --is-inside-work-tree > /dev/null }

# archive all modification files between ${BeginCommit} to ${EndCommit}
function git_commit_archive() {
    GIT_INSIDE_WORK_TREE || return

    local function error_hash() {
        [[ $1 =~ "^HEAD\^*$" || $1 =~ "^[a-f0-9]+$" ]] && return 1
        return 0
    }

    ( (( $# < 2 )) || error_hash $1 || error_hash $2 ) && {
        echo "Usage: git_commit_archive [BeginCommit] [EndCommit] [Output.zip]" && return
    }

    local BeginCommit=$1 EndCommit=$2 Output=${3:-"Output.zip"}

    [[ $Output =~ "\.zip$" ]] || Output="$Output.zip"

    local ArchiveFiles=$(git diff --name-only $BeginCommit $EndCommit)

    echo "Archive File List:"
    echo $ArchiveFiles | xargs -I % echo -e "\t%"
    echo "====> $Output"

    git archive -o $Output $EndCommit $(git diff --name-only $BeginCommit $EndCommit)
}

function z() {
    [[ $# == 1 ]] && {
        [[ $1 == ~ ]] && cd ~ && return
        [[ $1 == - ]] && cd - > /dev/null && return
        [[ -d   $1 ]] && cd $1 && return
    }

    listDir=$(fd -Hpat d --base-directory=$HOME -E ".git" -E ".npm" $1)
    for i in $*; do
        listDir=$(echo $listDir | grep $i)
    done

    Dir=$(echo $listDir | sort -u | fzf --height 40% --layout=reverse --scheme=path --query="$*")
    [[ -d $Dir ]] && cd $Dir
}
