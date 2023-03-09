#!/bin/bash
#
# Windows Git bashrc
# Some Useful function in Windows version
#
function git_commit_archive() {
    function error_hash() {
        [[ $1 =~ ^HEAD\^*$ || $1 =~ ^[a-f0-9]+$ ]] && return 1
        return 0
    }

    ( (( $# < 2 )) || error_hash $1 || error_hash $2 ) && \
        echo "Usage: git_commit_archive [BeginCommit] [EndCommit] [Output.zip]" && return

    local BeginCommit=$1
    local EndCommit=$2
    local Output=${3:-"Output.zip"}
    [[ $Output =~ .zip$ ]] || Output="$Output.zip"

    local ArchiveFiles=$(git diff --name-only $BeginCommit $EndCommit)
    [[ -z $ArchiveFiles ]] && return

    echo "Archive File List:"
    echo $ArchiveFiles | xargs -I % echo -e "\t%"
    echo "====> $Output"

    git archive -o $Output $EndCommit $(git diff --name-only $BeginCommit $EndCommit)
}

alias garch=git_commit_archive
