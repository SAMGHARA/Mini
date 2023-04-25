# Core
MZ_CONFIGS="$MZ/configs"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

export XDG_LOCAL_HOME="$HOME/.local"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

setopt no_nomatch
setopt rmstarsilent

# ignore <tab> completion case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

function addAlias() {
    for k v (${(kv)${(P)1}}) {
        alias $k=$v
    }
}

function addBindKey() {
    for k v (${(kv)${(P)1}}) {
        bindkey $k $v
    }
}

function addENV() {
    for i (${(P)2}) {
        [[ ${(P)1} != *$i* ]] && export $1=${(P)1}:$i
    }
}

function cecho() {
    (( $# != 2 )) && echo $1 && return
    case $1 {
        (Red)    echo -e "\e[31m$2\e[0m" ;;
        (Green)  echo -e "\e[32m$2\e[0m" ;;
        (Yellow) echo -e "\e[33m$2\e[0m" ;;
        (Blue)   echo -e "\e[34m$2\e[0m" ;;
        (Cyan)   echo -e "\e[36m$2\e[0m" ;;
        (*)      echo $2 ;;
    }
}

function duh() {
    local depth=$1
    du -h --max-depth=${depth:-1}
}

function frm() {
    find -name $1 | xargs -tpI % rm %
}

function cmk() {
    local opts=()
    while {getopts D:i:c arg} {
       case $arg {
            (D) opts+=("-D$OPTARG")                          ;;
            (i) opts+=("-DCMAKE_INSTALL_PREFIX=$OPTARG")     ;;
            (c) opts+=("-DCMAKE_EXPORT_COMPILE_COMMANDS=on") ;;
       }
    }
    opts+=($*[$OPTIND,-1])
    cecho Yellow "❯❯❯ cmake $opts" && cmake $opts
}

function gr() {
    (( $# < 1 )) && return

    local cfile=$1
    local output=${2:-"main"}
    local cxx="g++"
    [[ $cfile =~ "\.c$" ]] && cxx="gcc"

    echo "$cxx $cfile -o $output && ./$output && rm $output"
    $cxx $cfile -o $output && ./$output && rm $output
}

# System
typeset -A systemAlias=( 
    ls      "ls --color"
    la      "ls -la --color"
    rr      "rm -r"
    src     "source $HOME/.zshrc"

    v       "vim"
    vst     "vim +StartupTime"
    vvi     "vim $MINI/nvim/init.lua"

    vcore   "vim $MZ_CONFIGS/core.zsh"
    vgit    "vim $MZ_CONFIGS/git.zsh"
    vpath   "vim $MZ_CONFIGS/path.zsh"

    syyu    "sudo pacman -Syyu"
    qdtq    "sudo pacman -Rn \$(sudo pacman -Qdtq)"
 )
addAlias systemAlias

typeset -A systemBindKey=( 
    "\e[1~" beginning-of-line       # <home>
    "^[[H"  beginning-of-line       # <home>

    "\e[4~" end-of-line             # <end>
    "^[[F"  end-of-line             # <end>

    "\e[3~" delete-char             # <delete>
    "^[[j~" delete-char             # <delete>

    # https://blog.csdn.net/z1w10281a/article/details/121488309
    "\eh" backward-char            # <Alt-h> <left>
    "\ej" down-line-or-history     # <Alt-j> <down>
    "\ek" up-line-or-history       # <Alt-k> <up>
    "\el" forward-char             # <Alt-l> <right>
 )
addBindKey systemBindKey

source "$MZ_CONFIGS/git.zsh"
source "$MZ_CONFIGS/path.zsh"
source "$MZ_CONFIGS/tmux.zsh"
