# Git
# https://github.com/junegunn/fzf/wiki/Examples#git
# https://github.com/wfxr/forgit

FZF_FORGIT_DEFAULT_OPTS="
--ansi
--no-sort
--reverse
--tiebreak=index
--bind 'alt-j:down,alt-k:up'
--bind 'ctrl-j:preview-down,ctrl-k:preview-up'
"

FZF_FORGIT_DIFF_PAGER=$(git config pager.diff || echo "cat")
FZF_FORGIT_EXTRACT_HASH="grep -Eo '[a-f0-9]+' | head -1 | tr -d '[:space:]'"
FZF_FORGIT_PREVIEW_LOG="echo {} | $FZF_FORGIT_EXTRACT_HASH | xargs -I % sh -c 'git show --color=always % | $FZF_FORGIT_DIFF_PAGER'"

function fzf_forgit_inside_work_tree() { git rev-parse --is-inside-work-tree > /dev/null }

function fzf_forgit_log() {
    fzf_forgit_inside_work_tree || return

    FZF_FORGIT_LOG_COMMAND="git log --graph --color=always --date=format:'%Y-%m-%d %H:%M' \
        --pretty=format:'%C(yellow)%h%d %C(magenta)%cd %C(blue)%cn %C(white)%s %Creset'"

    eval $FZF_FORGIT_LOG_COMMAND | \
        FZF_DEFAULT_OPTS="$FZF_FORGIT_DEFAULT_OPTS
            --no-multi
            --bind \"enter:execute:$FZF_FORGIT_PREVIEW_LOG | less -R\"
            --preview=\"$FZF_FORGIT_PREVIEW_LOG\"" fzf
}

function fzf_forgit_add() {
    fzf_forgit_inside_work_tree || return

    # Add files if passed as arguments
    [[ $# -ne 0 ]] && git add "$@" && git status -su && return

    local files preview extract
    extract="sed 's/^.*]  //' | sed 's/.* -> //' | sed -e 's/^\\\"//' -e 's/\\\"\$//'"
    preview="file=\$(echo {} | $extract)
             if (git status -s -- \\\"\$file\\\" | grep '^??') &>/dev/null; then  # diff with /dev/null for untracked files
                 git diff --color=always --no-index -- /dev/null \\\"\$file\\\" | $FZF_FORGIT_DIFF_PAGER | sed '2 s/added:/untracked:/'
             else
                 git diff --color=always -- \\\"\$file\\\" | $FZF_FORGIT_DIFF_PAGER
             fi"

    files=$(git -c color.status=always -c status.relativePaths=true status -su |
        sed -E 's/^(..[^[:space:]]*)[[:space:]]+(.*)$/[\1]  \2/' |
        FZF_DEFAULT_OPTS="$FZF_FORGIT_DEFAULT_OPTS -0 -m --nth 2..,..
            --bind 'tab:toggle,btab:' --preview=\"$preview\"" fzf |
        sh -c "$extract")

    [[ -n "$files" ]] && echo "$files" | tr '\n' '\0' | git add --pathspec-file-nul --pathspec-from-file - && git status -su && return

    echo 'Nothing to add.'
}

function git_commit_archive() {
    local function error_hash() {
        [[ $1 =~ "^HEAD\^*$" || $1 =~ "^[a-f0-9]+$" ]] && return 1
        return 0
    }

    ( (( $# < 2 )) || error_hash $1 || error_hash $2 ) && \
        echo "Usage: git_commit_archive [BeginCommit] [EndCommit] [Output.zip]" && return

    unfunction error_hash

    local BeginCommit=$1
    local EndCommit=$2
    local Output=${3:-"Output.zip"}

    [[ $Output =~ ".zip$" ]] || Output="$Output.zip"

    local ArchiveFiles=$(git diff --name-only $BeginCommit $EndCommit)

    echo "Archive File List:"
    echo $ArchiveFiles | xargs -I % echo -e "\t%"
    echo "====> $Output"

    git archive -o $Output $EndCommit $(git diff --name-only $BeginCommit $EndCommit)
}

typeset -A gitAlias=(
    g       git
    garch   git_commit_archive
    gl      fzf_forgit_log
    ga      fzf_forgit_add
)
addAlias gitAlias

