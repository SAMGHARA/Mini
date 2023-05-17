# Git
# https://github.com/junegunn/fzf/wiki/Examples#git
# https://github.com/wfxr/forgit

local FZF_FORGIT_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--ansi
--no-sort
--reverse
--tiebreak=index
"

local FZF_FORGIT_DIFF_PAGER=$(git config pager.diff || echo "cat")
local FZF_FORGIT_EXTRACT_HASH="grep -Eo '[a-f0-9]+' | head -1 | tr -d '[:space:]'"

function FZF_FORGIT_INSIDE_WORK_TREE() { git rev-parse --is-inside-work-tree > /dev/null }

function fzf_forgit_log() {
    FZF_FORGIT_INSIDE_WORK_TREE || return 1

    local FILES FZF_COMMAND FZF_PREVIEW FZF_OPTS

    FILES=${1:-""}

    (( ${#FILES} != 0 )) && FILES="--follow $FILES"

    FZF_COMMAND="git log --color=always --date=format:'%m-%d' --pretty=format:'%C(yellow)%h%d %C(magenta)%cd %C(blue)%cn %C(white)%s %Creset'"

    FZF_PREVIEW="echo {} | $FZF_FORGIT_EXTRACT_HASH | xargs -I% git show --color=always -U3 % -- $FILES | $FZF_FORGIT_DIFF_PAGER"

    FZF_OPTS="$FZF_FORGIT_DEFAULT_OPTS
              +s +m --tiebreak=index
              --preview=\"$FZF_PREVIEW\""

    eval "$FZF_COMMAND $FILES" | FZF_DEFAULT_OPTS="$FZF_OPTS" fzf
}

function fzf_forgit_add() {
    FZF_FORGIT_INSIDE_WORK_TREE || return 1

    local FZF_EXTRACT FZF_COMMAND FZF_PREVIEW FZF_OPTS FILES

    FZF_EXTRACT="sed 's/^.*]  //' | sed 's/.* -> //' | sed -e 's/^\\\"//' -e 's/\\\"\$//'"

    FZF_COMMAND="git -c color.status=always -c status.relativePaths=true status -su |
                 sed -E 's/^(..[^[:space:]]*)[[:space:]]+(.*)$/[\1]  \2/'"

    FZF_PREVIEW="file=\$(echo {} | $FZF_EXTRACT)
                 if (git status -s -- \\\"\$file\\\" | grep '^??') &>/dev/null; then
                     git diff --color=always --no-index -- /dev/null \\\"\$file\\\" |
                     $FZF_FORGIT_DIFF_PAGER | sed '2 s/added:/untracked:/'
                 else
                     git diff --color=always -- \\\"\$file\\\" | $FZF_FORGIT_DIFF_PAGER
                 fi"

    FZF_OPTS="$FZF_FORGIT_DEFAULT_OPTS
             -0 -m --nth 2..,..
             --bind 'tab:toggle,btab:'
             --preview=\"$FZF_PREVIEW\""

    FILES=$(sh -c $FZF_COMMAND | FZF_DEFAULT_OPTS="$FZF_OPTS" fzf | sh -c "$FZF_EXTRACT")

    [[ -n "$FILES" ]] && echo "$FILES" | tr '\n' '\0' | git add --pathspec-file-nul --pathspec-from-file - && git status -su && return

    echo 'Nothing to add.'
}

function git_commit_archive() {
    FZF_FORGIT_INSIDE_WORK_TREE || return

    local function error_hash() {
        [[ $1 =~ "^HEAD\^*$" || $1 =~ "^[a-f0-9]+$" ]] && return 1
        return 0
    }

    ( (( $# < 2 )) || error_hash $1 || error_hash $2 ) && \
        echo "Usage: git_commit_archive [BeginCommit] [EndCommit] [Output.zip]" && return

    unfunction error_hash

    local BeginCommit=$1 EndCommit=$2 Output=${3:-"Output.zip"}

    [[ $Output =~ "\.zip$" ]] || Output="$Output.zip"

    local ArchiveFiles=$(git diff --name-only $BeginCommit $EndCommit)

    echo "Archive File List:"
    echo $ArchiveFiles | xargs -I % echo -e "\t%"
    echo "====> $Output"

    git archive -o $Output $EndCommit $(git diff --name-only $BeginCommit $EndCommit)
}

typeset -A gitAlias=(
    g       git
    gl      fzf_forgit_log
    ga      fzf_forgit_add
    garch   git_commit_archive
)
addAlias gitAlias

